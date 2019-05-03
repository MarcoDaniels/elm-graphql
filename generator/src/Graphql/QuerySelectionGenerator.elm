module Graphql.QuerySelectionGenerator exposing (..)

import Debug
import Dict exposing (Dict)
import Graphql.Generator.Context exposing (Context)
import Graphql.Generator.Decoder as Decoder
import Graphql.Generator.Group exposing (IntrospectionData)
import Graphql.Generator.ModuleName as ModuleName
import Graphql.Parser.CamelCaseName as CamelCaseName
import Graphql.Parser.ClassCaseName as ClassCaseName
import Graphql.Parser.Type as Type exposing (IsNullable(..), DefinableType(..), TypeReference(..), TypeDefinition(..), ReferrableType(..))
import ModuleName exposing (ModuleName(..))
import Graphql.Parser.Scalar as Scalar

import Set exposing (Set)
import Graphql.QueryParser exposing (..)

--utility from Result extra


combine =
    List.foldr (Result.map2 (::)) (Ok [])



--

type alias RecordContext =
    Dict String (List { fieldName : String, fieldType : String })

argumentsToString : List Argument -> String
argumentsToString arguments =
    arguments
        |> List.map (\argument ->
            argument.name ++ " = " ++
            case argument.value of 
                Variable name -> "UNIMPLEMENTED"
                IntValue int -> String.fromInt int
                FloatValue float -> String.fromFloat float
                StringValue str -> str
                BooleanValue b -> if b then "True" else "False"
                NullValue  -> "UNIMPLEMENTED"
                EnumValue name -> "UNIMPLEMENTED"
                ListValue values ->  "UNIMPLEMENTED"
                ObjectValue objectValues ->  "UNIMPLEMENTED"
        )
        |> String.join ","

moduleName context typeDef =
    ModuleName.generate context typeDef

nameToTypeDef introspectionData =
    introspectionData.typeDefinitions
        |> List.map
            (\((TypeDefinition className _ _) as typeDef) ->
                ( ClassCaseName.raw className, typeDef )
            )
        |> Dict.fromList

findTypeDef introspectionData rootName =
    Dict.get rootName (nameToTypeDef introspectionData)

typeRefToString (TypeReference referrableType nullable) =
    let
        typeName = case referrableType of
            ObjectRef str -> 
                str
            Scalar scalar -> 
                Scalar.toString scalar
            List typeRef ->
                "List (" ++ typeRefToString typeRef ++ ")"
            _ ->
                "foo0"
    in
        case nullable of
            Nullable -> "Maybe (" ++ typeName ++ ")"
            NonNullable -> typeName


typeRefToType (TypeReference referrableType nullable) =
        case referrableType of
            ObjectRef str -> 
                str
            Scalar scalar -> 
                Scalar.toString scalar
            List typeRef ->
                typeRefToType typeRef
            _ ->
                "foo0"

selectionSetToString : Context -> IntrospectionData -> TypeDefinition -> RecordContext -> SelectionSet -> Result String { imports : Set String, body : String, correspondElmType : { fieldName : String, fieldType : String }, recordContext : RecordContext }
selectionSetToString context introspectionData ((TypeDefinition classCaseName definableType maybeDescription) as typeDef) recordContext selectionSet_ =
    let
        targetRecordName =
            ClassCaseName.raw classCaseName ++ "Record"

        modulePath =
            moduleName context typeDef
                |> String.join "."
    in
    selectionSet_
        |> List.map
            (\((Field fieldType) as selection) ->
                let
                    maybeFieldTypeRef =
                        case definableType of
                            ObjectType fields ->
                                fields
                                    |> List.map (\field_ -> ( CamelCaseName.raw field_.name, field_ ))
                                    |> Dict.fromList
                                    |> Dict.get fieldType.name
                                    |> Maybe.map .typeRef

                            _ ->
                                Nothing
                        
                    fullyQualifiedFieldSelector =
                        modulePath ++ "." ++ fieldType.name ++
                            if List.isEmpty fieldType.arguments then
                                ""
                            else
                                "{" ++ (argumentsToString fieldType.arguments) ++ "}"
                in
                case maybeFieldTypeRef of
                    Nothing ->
                        Err ("No such type for field: " ++ fieldType.name)

                    Just ((TypeReference referrableType isNullable) as typeRef) ->
                        let
                            nullable = isNullable == Nullable
                        
                            typeName = typeRefToString typeRef

                            maybeSubFieldTypeDef =
                                findTypeDef introspectionData (typeRefToType typeRef)
                        in
                        case (maybeSubFieldTypeDef, fieldType.selectionSet) of
                            ( Nothing, _ ) ->
                                Err ("Can't resolve " ++ fieldType.name ++ " of type " ++ typeName)

                            ( _, Nothing ) ->
                                --scalar case
                                Ok
                                    { imports = Set.singleton modulePath
                                    , body = "|> with " ++ fullyQualifiedFieldSelector
                                    , correspondElmType =
                                        { fieldName = fieldType.name
                                        , fieldType = typeName
                                        }
                                    , recordContext = recordContext
                                    }

                            (Just fieldTypeDef, Just selectionSet__ ) ->
                                selectionSetToString context introspectionData fieldTypeDef recordContext selectionSet__
                                    |> Result.map
                                        (\result ->
                                            { imports =
                                                result.imports
                                                    |> Set.insert modulePath
                                            , body = "|> with (" ++ fullyQualifiedFieldSelector ++ " (\n" ++ result.body ++ "\n))"
                                            , correspondElmType = 
                                                { fieldName = fieldType.name
                                                , fieldType = typeName -- (if nullable then "Maybe " else "") ++ result.correspondElmType.fieldType 
                                                }
                                            , recordContext = result.recordContext
                                            }
                                        )
            )
        |> combine
        |> Result.map
            (\results ->
                { imports =
                    results
                        |> List.map .imports
                        |> List.foldl Set.union Set.empty
                , body =
                    results
                        |> List.map .body
                        |> String.join "\n"
                , correspondElmType = { fieldName = "foo", fieldType = "foo1" }
                , recordContext =
                    results
                        |> List.map .recordContext
                        |> List.foldl
                            (Dict.merge
                                (\key a -> Dict.insert key a)
                                (\key a b -> Dict.insert key a)
                                (\key b -> Dict.insert key b)
                                Dict.empty
                            )
                            Dict.empty
                        |>  Dict.insert targetRecordName (results |> List.map .correspondElmType)
                }
            )
        |> Result.andThen
            (\result ->
                Ok
                    { imports =
                        result.imports
                            |> Set.insert modulePath
                    , body = "SelectionSet.succeed " ++ targetRecordName ++ "\n" ++ result.body
                    , correspondElmType = { fieldName = "foo", fieldType = targetRecordName }
                    , recordContext = result.recordContext
                    }
            )

opDefToString : Context -> IntrospectionData -> OperationDefintion -> Result String { imports : Set String, body : String, recordContext : RecordContext, correspondElmType : { fieldName : String, fieldType : String } }
opDefToString context introspectionData opDef =
    case opDef of
        Operation operationRecord ->
            let
                selectionSet_ =
                    operationRecord.selectionSet

                maybeFieldName =
                    case operationRecord.type_ of
                        Query ->
                            Just introspectionData.queryObjectName

                        Mutation ->
                            introspectionData.mutationObjectName

                        Subscription ->
                            introspectionData.subscriptionObjectName

                maybeTypeDef =
                    maybeFieldName
                        |> Maybe.andThen (findTypeDef introspectionData)
            in
            case maybeTypeDef of
                Just typeDef ->
                    selectionSetToString context introspectionData typeDef Dict.empty selectionSet_
                    --     |> Result.map (\{ imports, body, correspondElmType, recordContext } -> 
                    --     { imports = imports, body = body, recordContext = recordContext }
                    -- )

                Nothing ->
                    Err ("Can't find " ++ (maybeFieldName |> Maybe.withDefault "unknown type"))

        _ ->
            Err "Unsupported root level structure"

transform : { apiSubmodule : List String, scalarCodecsModule : Maybe ModuleName } -> IntrospectionData -> Context -> String -> Result String String
transform options introspectionData context query =
    parse query
        |> Result.mapError (always "Parser Error")
        |> Result.andThen (opDefToString context introspectionData)
        |> Result.map
            (\{ imports, body, recordContext, correspondElmType } ->
                let
                    modulePath = 
                        List.append options.apiSubmodule [ "Foo" ]
                            |> String.join "."

                in
                "module "++ modulePath ++" exposing (..)\n\n"
                    ++ "import Graphql.SelectionSet as SelectionSet exposing (SelectionSet, hardcoded, with)\n"
                    ++ "import Graphql.Operation exposing (RootQuery)\n"
                    ++ (Set.toList imports
                            |> List.map ((++) "import ")
                            |> String.join "\n"
                       )
                    ++ encodeRecords recordContext
                    ++ "\n\nselection : SelectionSet "++ correspondElmType.fieldType ++ " RootQuery"
                    ++ "\nselection = "
                    ++ body
            )


encodeRecords : Dict String (List { fieldName : String, fieldType : String }) -> String
encodeRecords recordNameToDefinition =
    recordNameToDefinition
        |> Dict.toList
        |> List.map
            (\( recordName, fields ) ->
                "\ntype alias "
                    ++ recordName
                    ++ " =\n{"
                    ++ (fields
                            |> List.map
                                (\{ fieldName, fieldType } ->
                                    fieldName ++ " : " ++ fieldType
                                )
                            |> String.join "\n,"
                       )
                    ++ "\n}"
            )
        |> String.join "\n"

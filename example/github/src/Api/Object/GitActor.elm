module Api.Object.GitActor exposing (..)

import Api.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Builder.Object as Object exposing (Object)
import Graphqelm.Value as Value exposing (Value)
import Json.Decode as Decode


build : (a -> constructor) -> Object (a -> constructor) Api.Object.GitActor
build constructor =
    Object.object constructor


avatarUrl : ({ size : Maybe Int } -> { size : Maybe Int }) -> FieldDecoder String Api.Object.GitActor
avatarUrl fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { size = Nothing }

        optionalArgs =
            [ Argument.optional "size" filledInOptionals.size Value.int ]
                |> List.filterMap identity
    in
    Object.fieldDecoder "avatarUrl" optionalArgs Decode.string


date : FieldDecoder String Api.Object.GitActor
date =
    Object.fieldDecoder "date" [] Decode.string


email : FieldDecoder String Api.Object.GitActor
email =
    Object.fieldDecoder "email" [] Decode.string


name : FieldDecoder String Api.Object.GitActor
name =
    Object.fieldDecoder "name" [] Decode.string


user : Object user Api.Object.User -> FieldDecoder user Api.Object.GitActor
user object =
    Object.single "user" [] object

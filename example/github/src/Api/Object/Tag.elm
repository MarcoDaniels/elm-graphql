module Api.Object.Tag exposing (..)

import Api.Object
import Graphqelm.Argument as Argument exposing (Argument)
import Graphqelm.Field as Field exposing (Field, FieldDecoder)
import Graphqelm.Object as Object exposing (Object)
import Json.Decode as Decode


build : (a -> constructor) -> Object (a -> constructor) Api.Object.Tag
build constructor =
    Object.object constructor


abbreviatedOid : FieldDecoder String Api.Object.Tag
abbreviatedOid =
    Field.fieldDecoder "abbreviatedOid" [] Decode.string


commitResourcePath : FieldDecoder String Api.Object.Tag
commitResourcePath =
    Field.fieldDecoder "commitResourcePath" [] Decode.string


commitUrl : FieldDecoder String Api.Object.Tag
commitUrl =
    Field.fieldDecoder "commitUrl" [] Decode.string


id : FieldDecoder String Api.Object.Tag
id =
    Field.fieldDecoder "id" [] Decode.string


message : FieldDecoder String Api.Object.Tag
message =
    Field.fieldDecoder "message" [] Decode.string


name : FieldDecoder String Api.Object.Tag
name =
    Field.fieldDecoder "name" [] Decode.string


oid : FieldDecoder String Api.Object.Tag
oid =
    Field.fieldDecoder "oid" [] Decode.string


repository : Object repository Api.Object.Repository -> FieldDecoder repository Api.Object.Tag
repository object =
    Object.single "repository" [] object


tagger : Object tagger Api.Object.GitActor -> FieldDecoder tagger Api.Object.Tag
tagger object =
    Object.single "tagger" [] object


target : Object target Api.Object.GitObject -> FieldDecoder target Api.Object.Tag
target object =
    Object.single "target" [] object
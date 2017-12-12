module Api.Object.ReleaseEdge exposing (..)

import Api.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Builder.Object as Object exposing (Object)
import Graphqelm.Value as Value exposing (Value)
import Json.Decode as Decode


build : (a -> constructor) -> Object (a -> constructor) Api.Object.ReleaseEdge
build constructor =
    Object.object constructor


cursor : FieldDecoder String Api.Object.ReleaseEdge
cursor =
    Object.fieldDecoder "cursor" [] Decode.string


node : Object node Api.Object.Release -> FieldDecoder node Api.Object.ReleaseEdge
node object =
    Object.single "node" [] object

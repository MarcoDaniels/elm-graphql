module Api.Object.ReviewDismissalAllowanceConnection exposing (..)

import Api.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Builder.Object as Object exposing (Object)
import Graphqelm.Value as Value exposing (Value)
import Json.Decode as Decode


build : (a -> constructor) -> Object (a -> constructor) Api.Object.ReviewDismissalAllowanceConnection
build constructor =
    Object.object constructor


edges : Object edges Api.Object.ReviewDismissalAllowanceEdge -> FieldDecoder (List edges) Api.Object.ReviewDismissalAllowanceConnection
edges object =
    Object.listOf "edges" [] object


nodes : Object nodes Api.Object.ReviewDismissalAllowance -> FieldDecoder (List nodes) Api.Object.ReviewDismissalAllowanceConnection
nodes object =
    Object.listOf "nodes" [] object


pageInfo : Object pageInfo Api.Object.PageInfo -> FieldDecoder pageInfo Api.Object.ReviewDismissalAllowanceConnection
pageInfo object =
    Object.single "pageInfo" [] object


totalCount : FieldDecoder Int Api.Object.ReviewDismissalAllowanceConnection
totalCount =
    Object.fieldDecoder "totalCount" [] Decode.int

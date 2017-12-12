module Api.Object.OrganizationInvitationConnection exposing (..)

import Api.Object
import Graphqelm.Builder.Argument as Argument exposing (Argument)
import Graphqelm.FieldDecoder as FieldDecoder exposing (FieldDecoder)
import Graphqelm.Builder.Object as Object exposing (Object)
import Graphqelm.Value as Value exposing (Value)
import Json.Decode as Decode


build : (a -> constructor) -> Object (a -> constructor) Api.Object.OrganizationInvitationConnection
build constructor =
    Object.object constructor


edges : Object edges Api.Object.OrganizationInvitationEdge -> FieldDecoder (List edges) Api.Object.OrganizationInvitationConnection
edges object =
    Object.listOf "edges" [] object


nodes : Object nodes Api.Object.OrganizationInvitation -> FieldDecoder (List nodes) Api.Object.OrganizationInvitationConnection
nodes object =
    Object.listOf "nodes" [] object


pageInfo : Object pageInfo Api.Object.PageInfo -> FieldDecoder pageInfo Api.Object.OrganizationInvitationConnection
pageInfo object =
    Object.single "pageInfo" [] object


totalCount : FieldDecoder Int Api.Object.OrganizationInvitationConnection
totalCount =
    Object.fieldDecoder "totalCount" [] Decode.int

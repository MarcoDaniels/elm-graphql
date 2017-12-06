module Api.Object.AddPullRequestReviewCommentPayload exposing (..)

import Api.Object
import Graphqelm.Argument as Argument exposing (Argument)
import Graphqelm.Field as Field exposing (Field, FieldDecoder)
import Graphqelm.Object as Object exposing (Object)
import Json.Decode as Decode


build : (a -> constructor) -> Object (a -> constructor) Api.Object.AddPullRequestReviewCommentPayload
build constructor =
    Object.object constructor


clientMutationId : FieldDecoder String Api.Object.AddPullRequestReviewCommentPayload
clientMutationId =
    Field.fieldDecoder "clientMutationId" [] Decode.string


comment : Object comment Api.Object.PullRequestReviewComment -> FieldDecoder comment Api.Object.AddPullRequestReviewCommentPayload
comment object =
    Object.single "comment" [] object


commentEdge : Object commentEdge Api.Object.PullRequestReviewCommentEdge -> FieldDecoder commentEdge Api.Object.AddPullRequestReviewCommentPayload
commentEdge object =
    Object.single "commentEdge" [] object
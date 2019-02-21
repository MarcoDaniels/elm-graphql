module Graphql.PaginatorSetup exposing (CurrentPage, Direction(..), PageInfo, PaginatedData, addPageInfo, init)

import Graphql.OptionalArgument as OptionalArgument exposing (OptionalArgument(..))


init : Direction -> List data -> PaginatedData data cursor
init paginatorSetup initialData =
    { data = initialData
    , currentPage = { cursor = Nothing, done = False }
    , setup = paginatorSetup
    }


type alias PaginatedData data cursor =
    { data : List data
    , currentPage : CurrentPage cursor
    , setup : Direction
    }


type alias PageInfo pageInfo cursor =
    { pageInfo
        | first : OptionalArgument Int
        , last : OptionalArgument Int
        , before : OptionalArgument cursor
        , after : OptionalArgument cursor
    }


{-| TODO
-}
addPageInfo : Maybe cursor -> Direction -> PageInfo pageInfo cursor -> PageInfo pageInfo cursor
addPageInfo maybeCursor paginationSetup optionals =
    case paginationSetup of
        Forward { first } ->
            { optionals
                | first = Present first
                , after = OptionalArgument.fromMaybe maybeCursor
            }

        Backward { last } ->
            { optionals
                | last = Present last
                , before = OptionalArgument.fromMaybe maybeCursor
            }


{-| Uses [the relay protocol](https://facebook.github.io/relay/graphql/connections.htm).
-}
type Direction
    = Forward { first : Int }
    | Backward { last : Int }


type alias CurrentPage cursorType =
    { cursor : Maybe cursorType
    , done : Bool
    }
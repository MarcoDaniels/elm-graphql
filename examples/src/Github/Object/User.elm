-- Do not manually edit this file, it was auto-generated by dillonkearns/elm-graphql
-- https://github.com/dillonkearns/elm-graphql


module Github.Object.User exposing (..)

import Github.Enum.GistPrivacy
import Github.Enum.IssueState
import Github.Enum.PullRequestState
import Github.Enum.RepositoryAffiliation
import Github.Enum.RepositoryContributionType
import Github.Enum.RepositoryPrivacy
import Github.InputObject
import Github.Interface
import Github.Object
import Github.Scalar
import Github.ScalarCodecs
import Github.Union
import Graphql.Internal.Builder.Argument as Argument exposing (Argument)
import Graphql.Internal.Builder.Object as Object
import Graphql.Internal.Encode as Encode exposing (Value)
import Graphql.Operation exposing (RootMutation, RootQuery, RootSubscription)
import Graphql.OptionalArgument exposing (OptionalArgument(..))
import Graphql.SelectionSet exposing (SelectionSet)
import Json.Decode as Decode


type alias AvatarUrlOptionalArguments =
    { size : OptionalArgument Int }


{-| A URL pointing to the user's public avatar.

  - size - The size of the resulting square image.

-}
avatarUrl :
    (AvatarUrlOptionalArguments -> AvatarUrlOptionalArguments)
    -> SelectionSet Github.ScalarCodecs.Uri Github.Object.User
avatarUrl fillInOptionals =
    let
        filledInOptionals =
            fillInOptionals { size = Absent }

        optionalArgs =
            [ Argument.optional "size" filledInOptionals.size Encode.int ]
                |> List.filterMap identity
    in
    Object.selectionForField "ScalarCodecs.Uri" "avatarUrl" optionalArgs (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| The user's public profile bio.
-}
bio : SelectionSet (Maybe String) Github.Object.User
bio =
    Object.selectionForField "(Maybe String)" "bio" [] (Decode.string |> Decode.nullable)


{-| The user's public profile bio as HTML.
-}
bioHTML : SelectionSet Github.ScalarCodecs.Html Github.Object.User
bioHTML =
    Object.selectionForField "ScalarCodecs.Html" "bioHTML" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecHtml |> .decoder)


type alias CommitCommentsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of commit comments made by this user.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
commitComments :
    (CommitCommentsOptionalArguments -> CommitCommentsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.CommitCommentConnection
    -> SelectionSet decodesTo Github.Object.User
commitComments fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "commitComments" optionalArgs object_ identity


{-| The user's public profile company.
-}
company : SelectionSet (Maybe String) Github.Object.User
company =
    Object.selectionForField "(Maybe String)" "company" [] (Decode.string |> Decode.nullable)


{-| The user's public profile company as HTML.
-}
companyHTML : SelectionSet Github.ScalarCodecs.Html Github.Object.User
companyHTML =
    Object.selectionForField "ScalarCodecs.Html" "companyHTML" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecHtml |> .decoder)


type alias ContributedRepositoriesOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy
    , orderBy : OptionalArgument Github.InputObject.RepositoryOrder
    , affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation))
    , isLocked : OptionalArgument Bool
    }


{-| A list of repositories that the user recently contributed to.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - If non-null, filters repositories according to privacy
  - orderBy - Ordering options for repositories returned from the connection
  - affiliations - Affiliation options for repositories returned from the connection
  - isLocked - If non-null, filters repositories according to whether they have been locked

-}
contributedRepositories :
    (ContributedRepositoriesOptionalArguments -> ContributedRepositoriesOptionalArguments)
    -> SelectionSet decodesTo Github.Object.RepositoryConnection
    -> SelectionSet decodesTo Github.Object.User
contributedRepositories fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent, affiliations = Absent, isLocked = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum Github.Enum.RepositoryPrivacy.toString), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeRepositoryOrder, Argument.optional "affiliations" filledInOptionals.affiliations (Encode.enum Github.Enum.RepositoryAffiliation.toString |> Encode.maybe |> Encode.list), Argument.optional "isLocked" filledInOptionals.isLocked Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "contributedRepositories" optionalArgs object_ identity


{-| Identifies the date and time when the object was created.
-}
createdAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.User
createdAt =
    Object.selectionForField "ScalarCodecs.DateTime" "createdAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| Identifies the primary key from the database.
-}
databaseId : SelectionSet (Maybe Int) Github.Object.User
databaseId =
    Object.selectionForField "(Maybe Int)" "databaseId" [] (Decode.int |> Decode.nullable)


{-| The user's publicly visible profile email.
-}
email : SelectionSet String Github.Object.User
email =
    Object.selectionForField "String" "email" [] Decode.string


type alias FollowersOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of users the given user is followed by.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
followers :
    (FollowersOptionalArguments -> FollowersOptionalArguments)
    -> SelectionSet decodesTo Github.Object.FollowerConnection
    -> SelectionSet decodesTo Github.Object.User
followers fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "followers" optionalArgs object_ identity


type alias FollowingOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of users the given user is following.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
following :
    (FollowingOptionalArguments -> FollowingOptionalArguments)
    -> SelectionSet decodesTo Github.Object.FollowingConnection
    -> SelectionSet decodesTo Github.Object.User
following fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "following" optionalArgs object_ identity


type alias GistRequiredArguments =
    { name : String }


{-| Find gist by repo name.

  - name - The gist name to find.

-}
gist :
    GistRequiredArguments
    -> SelectionSet decodesTo Github.Object.Gist
    -> SelectionSet (Maybe decodesTo) Github.Object.User
gist requiredArgs object_ =
    Object.selectionForCompositeField "gist" [ Argument.required "name" requiredArgs.name Encode.string ] object_ (identity >> Decode.nullable)


type alias GistCommentsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of gist comments made by this user.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
gistComments :
    (GistCommentsOptionalArguments -> GistCommentsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.GistCommentConnection
    -> SelectionSet decodesTo Github.Object.User
gistComments fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "gistComments" optionalArgs object_ identity


type alias GistsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , privacy : OptionalArgument Github.Enum.GistPrivacy.GistPrivacy
    , orderBy : OptionalArgument Github.InputObject.GistOrder
    }


{-| A list of the Gists the user has created.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - Filters Gists according to privacy.
  - orderBy - Ordering options for gists returned from the connection

-}
gists :
    (GistsOptionalArguments -> GistsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.GistConnection
    -> SelectionSet decodesTo Github.Object.User
gists fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum Github.Enum.GistPrivacy.toString), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeGistOrder ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "gists" optionalArgs object_ identity


id : SelectionSet Github.ScalarCodecs.Id Github.Object.User
id =
    Object.selectionForField "ScalarCodecs.Id" "id" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecId |> .decoder)


{-| Whether or not this user is a participant in the GitHub Security Bug Bounty.
-}
isBountyHunter : SelectionSet Bool Github.Object.User
isBountyHunter =
    Object.selectionForField "Bool" "isBountyHunter" [] Decode.bool


{-| Whether or not this user is a participant in the GitHub Campus Experts Program.
-}
isCampusExpert : SelectionSet Bool Github.Object.User
isCampusExpert =
    Object.selectionForField "Bool" "isCampusExpert" [] Decode.bool


{-| Whether or not this user is a GitHub Developer Program member.
-}
isDeveloperProgramMember : SelectionSet Bool Github.Object.User
isDeveloperProgramMember =
    Object.selectionForField "Bool" "isDeveloperProgramMember" [] Decode.bool


{-| Whether or not this user is a GitHub employee.
-}
isEmployee : SelectionSet Bool Github.Object.User
isEmployee =
    Object.selectionForField "Bool" "isEmployee" [] Decode.bool


{-| Whether or not the user has marked themselves as for hire.
-}
isHireable : SelectionSet Bool Github.Object.User
isHireable =
    Object.selectionForField "Bool" "isHireable" [] Decode.bool


{-| Whether or not this user is a site administrator.
-}
isSiteAdmin : SelectionSet Bool Github.Object.User
isSiteAdmin =
    Object.selectionForField "Bool" "isSiteAdmin" [] Decode.bool


{-| Whether or not this user is the viewing user.
-}
isViewer : SelectionSet Bool Github.Object.User
isViewer =
    Object.selectionForField "Bool" "isViewer" [] Decode.bool


type alias IssueCommentsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of issue comments made by this user.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
issueComments :
    (IssueCommentsOptionalArguments -> IssueCommentsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.IssueCommentConnection
    -> SelectionSet decodesTo Github.Object.User
issueComments fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "issueComments" optionalArgs object_ identity


type alias IssuesOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , labels : OptionalArgument (List String)
    , orderBy : OptionalArgument Github.InputObject.IssueOrder
    , states : OptionalArgument (List Github.Enum.IssueState.IssueState)
    }


{-| A list of issues assocated with this user.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - labels - A list of label names to filter the pull requests by.
  - orderBy - Ordering options for issues returned from the connection.
  - states - A list of states to filter the issues by.

-}
issues :
    (IssuesOptionalArguments -> IssuesOptionalArguments)
    -> SelectionSet decodesTo Github.Object.IssueConnection
    -> SelectionSet decodesTo Github.Object.User
issues fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, labels = Absent, orderBy = Absent, states = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "labels" filledInOptionals.labels (Encode.string |> Encode.list), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeIssueOrder, Argument.optional "states" filledInOptionals.states (Encode.enum Github.Enum.IssueState.toString |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "issues" optionalArgs object_ identity


{-| The user's public profile location.
-}
location : SelectionSet (Maybe String) Github.Object.User
location =
    Object.selectionForField "(Maybe String)" "location" [] (Decode.string |> Decode.nullable)


{-| The username used to login.
-}
login : SelectionSet String Github.Object.User
login =
    Object.selectionForField "String" "login" [] Decode.string


{-| The user's public profile name.
-}
name : SelectionSet (Maybe String) Github.Object.User
name =
    Object.selectionForField "(Maybe String)" "name" [] (Decode.string |> Decode.nullable)


type alias OrganizationRequiredArguments =
    { login : String }


{-| Find an organization by its login that the user belongs to.

  - login - The login of the organization to find.

-}
organization :
    OrganizationRequiredArguments
    -> SelectionSet decodesTo Github.Object.Organization
    -> SelectionSet (Maybe decodesTo) Github.Object.User
organization requiredArgs object_ =
    Object.selectionForCompositeField "organization" [ Argument.required "login" requiredArgs.login Encode.string ] object_ (identity >> Decode.nullable)


type alias OrganizationsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of organizations the user belongs to.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
organizations :
    (OrganizationsOptionalArguments -> OrganizationsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.OrganizationConnection
    -> SelectionSet decodesTo Github.Object.User
organizations fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "organizations" optionalArgs object_ identity


type alias PinnedRepositoriesOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy
    , orderBy : OptionalArgument Github.InputObject.RepositoryOrder
    , affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation))
    , isLocked : OptionalArgument Bool
    }


{-| A list of repositories this user has pinned to their profile

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - If non-null, filters repositories according to privacy
  - orderBy - Ordering options for repositories returned from the connection
  - affiliations - Affiliation options for repositories returned from the connection
  - isLocked - If non-null, filters repositories according to whether they have been locked

-}
pinnedRepositories :
    (PinnedRepositoriesOptionalArguments -> PinnedRepositoriesOptionalArguments)
    -> SelectionSet decodesTo Github.Object.RepositoryConnection
    -> SelectionSet decodesTo Github.Object.User
pinnedRepositories fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent, affiliations = Absent, isLocked = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum Github.Enum.RepositoryPrivacy.toString), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeRepositoryOrder, Argument.optional "affiliations" filledInOptionals.affiliations (Encode.enum Github.Enum.RepositoryAffiliation.toString |> Encode.maybe |> Encode.list), Argument.optional "isLocked" filledInOptionals.isLocked Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "pinnedRepositories" optionalArgs object_ identity


type alias PublicKeysOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    }


{-| A list of public keys associated with this user.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.

-}
publicKeys :
    (PublicKeysOptionalArguments -> PublicKeysOptionalArguments)
    -> SelectionSet decodesTo Github.Object.PublicKeyConnection
    -> SelectionSet decodesTo Github.Object.User
publicKeys fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "publicKeys" optionalArgs object_ identity


type alias PullRequestsOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , states : OptionalArgument (List Github.Enum.PullRequestState.PullRequestState)
    , labels : OptionalArgument (List String)
    , headRefName : OptionalArgument String
    , baseRefName : OptionalArgument String
    , orderBy : OptionalArgument Github.InputObject.IssueOrder
    }


{-| A list of pull requests assocated with this user.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - states - A list of states to filter the pull requests by.
  - labels - A list of label names to filter the pull requests by.
  - headRefName - The head ref name to filter the pull requests by.
  - baseRefName - The base ref name to filter the pull requests by.
  - orderBy - Ordering options for pull requests returned from the connection.

-}
pullRequests :
    (PullRequestsOptionalArguments -> PullRequestsOptionalArguments)
    -> SelectionSet decodesTo Github.Object.PullRequestConnection
    -> SelectionSet decodesTo Github.Object.User
pullRequests fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, states = Absent, labels = Absent, headRefName = Absent, baseRefName = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "states" filledInOptionals.states (Encode.enum Github.Enum.PullRequestState.toString |> Encode.list), Argument.optional "labels" filledInOptionals.labels (Encode.string |> Encode.list), Argument.optional "headRefName" filledInOptionals.headRefName Encode.string, Argument.optional "baseRefName" filledInOptionals.baseRefName Encode.string, Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeIssueOrder ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "pullRequests" optionalArgs object_ identity


type alias RepositoriesOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy
    , orderBy : OptionalArgument Github.InputObject.RepositoryOrder
    , affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation))
    , isLocked : OptionalArgument Bool
    , isFork : OptionalArgument Bool
    }


{-| A list of repositories that the user owns.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - If non-null, filters repositories according to privacy
  - orderBy - Ordering options for repositories returned from the connection
  - affiliations - Affiliation options for repositories returned from the connection
  - isLocked - If non-null, filters repositories according to whether they have been locked
  - isFork - If non-null, filters repositories according to whether they are forks of another repository

-}
repositories :
    (RepositoriesOptionalArguments -> RepositoriesOptionalArguments)
    -> SelectionSet decodesTo Github.Object.RepositoryConnection
    -> SelectionSet decodesTo Github.Object.User
repositories fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent, affiliations = Absent, isLocked = Absent, isFork = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum Github.Enum.RepositoryPrivacy.toString), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeRepositoryOrder, Argument.optional "affiliations" filledInOptionals.affiliations (Encode.enum Github.Enum.RepositoryAffiliation.toString |> Encode.maybe |> Encode.list), Argument.optional "isLocked" filledInOptionals.isLocked Encode.bool, Argument.optional "isFork" filledInOptionals.isFork Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "repositories" optionalArgs object_ identity


type alias RepositoriesContributedToOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy
    , orderBy : OptionalArgument Github.InputObject.RepositoryOrder
    , isLocked : OptionalArgument Bool
    , includeUserRepositories : OptionalArgument Bool
    , contributionTypes : OptionalArgument (List (Maybe Github.Enum.RepositoryContributionType.RepositoryContributionType))
    }


{-| A list of repositories that the user recently contributed to.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - If non-null, filters repositories according to privacy
  - orderBy - Ordering options for repositories returned from the connection
  - isLocked - If non-null, filters repositories according to whether they have been locked
  - includeUserRepositories - If true, include user repositories
  - contributionTypes - If non-null, include only the specified types of contributions. The GitHub.com UI uses [COMMIT, ISSUE, PULL\_REQUEST, REPOSITORY][COMMIT, ISSUE, PULL_REQUEST, REPOSITORY]

-}
repositoriesContributedTo :
    (RepositoriesContributedToOptionalArguments -> RepositoriesContributedToOptionalArguments)
    -> SelectionSet decodesTo Github.Object.RepositoryConnection
    -> SelectionSet decodesTo Github.Object.User
repositoriesContributedTo fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent, isLocked = Absent, includeUserRepositories = Absent, contributionTypes = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum Github.Enum.RepositoryPrivacy.toString), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeRepositoryOrder, Argument.optional "isLocked" filledInOptionals.isLocked Encode.bool, Argument.optional "includeUserRepositories" filledInOptionals.includeUserRepositories Encode.bool, Argument.optional "contributionTypes" filledInOptionals.contributionTypes (Encode.enum Github.Enum.RepositoryContributionType.toString |> Encode.maybe |> Encode.list) ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "repositoriesContributedTo" optionalArgs object_ identity


type alias RepositoryRequiredArguments =
    { name : String }


{-| Find Repository.

  - name - Name of Repository to find.

-}
repository :
    RepositoryRequiredArguments
    -> SelectionSet decodesTo Github.Object.Repository
    -> SelectionSet (Maybe decodesTo) Github.Object.User
repository requiredArgs object_ =
    Object.selectionForCompositeField "repository" [ Argument.required "name" requiredArgs.name Encode.string ] object_ (identity >> Decode.nullable)


{-| The HTTP path for this user
-}
resourcePath : SelectionSet Github.ScalarCodecs.Uri Github.Object.User
resourcePath =
    Object.selectionForField "ScalarCodecs.Uri" "resourcePath" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


type alias StarredRepositoriesOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , ownedByViewer : OptionalArgument Bool
    , orderBy : OptionalArgument Github.InputObject.StarOrder
    }


{-| Repositories the user has starred.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - ownedByViewer - Filters starred repositories to only return repositories owned by the viewer.
  - orderBy - Order for connection

-}
starredRepositories :
    (StarredRepositoriesOptionalArguments -> StarredRepositoriesOptionalArguments)
    -> SelectionSet decodesTo Github.Object.StarredRepositoryConnection
    -> SelectionSet decodesTo Github.Object.User
starredRepositories fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, ownedByViewer = Absent, orderBy = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "ownedByViewer" filledInOptionals.ownedByViewer Encode.bool, Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeStarOrder ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "starredRepositories" optionalArgs object_ identity


{-| Identifies the date and time when the object was last updated.
-}
updatedAt : SelectionSet Github.ScalarCodecs.DateTime Github.Object.User
updatedAt =
    Object.selectionForField "ScalarCodecs.DateTime" "updatedAt" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecDateTime |> .decoder)


{-| The HTTP URL for this user
-}
url : SelectionSet Github.ScalarCodecs.Uri Github.Object.User
url =
    Object.selectionForField "ScalarCodecs.Uri" "url" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder)


{-| Whether or not the viewer is able to follow the user.
-}
viewerCanFollow : SelectionSet Bool Github.Object.User
viewerCanFollow =
    Object.selectionForField "Bool" "viewerCanFollow" [] Decode.bool


{-| Whether or not this user is followed by the viewer.
-}
viewerIsFollowing : SelectionSet Bool Github.Object.User
viewerIsFollowing =
    Object.selectionForField "Bool" "viewerIsFollowing" [] Decode.bool


type alias WatchingOptionalArguments =
    { first : OptionalArgument Int
    , after : OptionalArgument String
    , last : OptionalArgument Int
    , before : OptionalArgument String
    , privacy : OptionalArgument Github.Enum.RepositoryPrivacy.RepositoryPrivacy
    , orderBy : OptionalArgument Github.InputObject.RepositoryOrder
    , affiliations : OptionalArgument (List (Maybe Github.Enum.RepositoryAffiliation.RepositoryAffiliation))
    , isLocked : OptionalArgument Bool
    }


{-| A list of repositories the given user is watching.

  - first - Returns the first _n_ elements from the list.
  - after - Returns the elements in the list that come after the specified global ID.
  - last - Returns the last _n_ elements from the list.
  - before - Returns the elements in the list that come before the specified global ID.
  - privacy - If non-null, filters repositories according to privacy
  - orderBy - Ordering options for repositories returned from the connection
  - affiliations - Affiliation options for repositories returned from the connection
  - isLocked - If non-null, filters repositories according to whether they have been locked

-}
watching :
    (WatchingOptionalArguments -> WatchingOptionalArguments)
    -> SelectionSet decodesTo Github.Object.RepositoryConnection
    -> SelectionSet decodesTo Github.Object.User
watching fillInOptionals object_ =
    let
        filledInOptionals =
            fillInOptionals { first = Absent, after = Absent, last = Absent, before = Absent, privacy = Absent, orderBy = Absent, affiliations = Absent, isLocked = Absent }

        optionalArgs =
            [ Argument.optional "first" filledInOptionals.first Encode.int, Argument.optional "after" filledInOptionals.after Encode.string, Argument.optional "last" filledInOptionals.last Encode.int, Argument.optional "before" filledInOptionals.before Encode.string, Argument.optional "privacy" filledInOptionals.privacy (Encode.enum Github.Enum.RepositoryPrivacy.toString), Argument.optional "orderBy" filledInOptionals.orderBy Github.InputObject.encodeRepositoryOrder, Argument.optional "affiliations" filledInOptionals.affiliations (Encode.enum Github.Enum.RepositoryAffiliation.toString |> Encode.maybe |> Encode.list), Argument.optional "isLocked" filledInOptionals.isLocked Encode.bool ]
                |> List.filterMap identity
    in
    Object.selectionForCompositeField "watching" optionalArgs object_ identity


{-| A URL pointing to the user's public website/blog.
-}
websiteUrl : SelectionSet (Maybe Github.ScalarCodecs.Uri) Github.Object.User
websiteUrl =
    Object.selectionForField "(Maybe ScalarCodecs.Uri)" "websiteUrl" [] (Github.ScalarCodecs.codecs |> Github.Scalar.unwrapCodecs |> .codecUri |> .decoder |> Decode.nullable)

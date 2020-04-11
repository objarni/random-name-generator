module Random.Name exposing (randomElement, randomName)

import Random
import Random.List


pickInt : ( Maybe Int, List Int ) -> Random.Generator (Maybe Int)
pickInt ( mi, _ ) =
    Random.constant mi


randomElement =
    Random.andThen
        pickInt
        (Random.List.choose [ 2 ])


type alias RandomName =
    { start : Maybe String
    , mid : Maybe String
    , end : Maybe String
    }


starts =
    [ "2", "5" ]


mids =
    [ "happy", "solemn" ]


ends =
    [ "monkeys", "owls" ]



--pickString : ( Maybe String, List String ) -> Random.Generator String
--pickString ( ms, _ ) =
--    case ms of
--        Just s ->
--            Random.constant s
--        _ ->
--            Random.constant ""
--randomNameInternal : Random.Generator RandomName
--randomNameInternal =
--    Random.map3
--        RandomName
--        (Random.andThen pickString (Random.List.choose starts))
--        (Random.andThen pickString (Random.List.choose mids))
--        (Random.andThen pickString (Random.List.choose ends))


randomName : Random.Generator String
randomName =
    Random.constant "hej"

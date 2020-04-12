module Random.Name exposing (dimension, randomName, randomNameFromSpace)

import Array
import Random
import Random.List



-- PUBLIC API


randomName : Random.Generator String
randomName =
    Random.map
        toString
        (randomNameInternal (Space builtinStart builtinMid builtinEnd))


randomNameFromSpace space =
    Random.map
        toString
        (randomNameInternal space)


dimension first second rest =
    Dim first second rest



-- TYPES


type alias RandomName =
    { start : String
    , mid : String
    , end : String
    }


type alias Space =
    { starts : Dim, mids : Dim, ends : Dim }


type Dim
    = Dim String String (List String)



-- IMPLEMENTATION


randomNameInternal : Space -> Random.Generator RandomName
randomNameInternal { starts, mids, ends } =
    Random.map3
        RandomName
        (pickFrom starts)
        (pickFrom mids)
        (pickFrom ends)


builtinStart =
    Dim "2" "3" [ "5", "7", "12", "20", "60", "500" ]


builtinMid =
    Dim
        "enthusiastic"
        "happy"
        [ "grateful"
        , "solemn"
        , "angry"
        , "eager"
        , "surprised"
        ]


builtinEnd =
    Dim "cows"
        "monkeys"
        [ "owls"
        , "hippos"
        , "spiders"
        , "snakes"
        , "dogs"
        , "cats"
        , "horses"
        ]


pickString : ( Maybe String, List String ) -> Random.Generator String
pickString ( ms, _ ) =
    let
        string =
            case ms of
                Just s ->
                    s

                Nothing ->
                    ""
    in
    Random.constant string


toString : RandomName -> String
toString { start, mid, end } =
    start ++ "-" ++ mid ++ "-" ++ end


pickFrom : Dim -> Random.Generator String
pickFrom (Dim first second rest) =
    Random.uniform first (second :: rest)

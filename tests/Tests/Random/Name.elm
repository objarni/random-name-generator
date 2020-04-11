module Tests.Random.Name exposing (suite1, suite2)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Random
import Random.Name exposing (randomElement, randomName)
import Test exposing (..)


suite1 : Test
suite1 =
    describe
        "testing choose"
        [ test "it will produce Just 2" <|
            \() ->
                let
                    ( element, _ ) =
                        Random.step Random.Name.randomElement (Random.initialSeed 0)
                in
                Expect.equal element (Just 2)
        ]


suite2 : Test
suite2 =
    describe "random name generator library"
        [ describe "randomName"
            [ test "it will produce a nice dashed random name string" <|
                \() ->
                    let
                        ( name, _ ) =
                            Random.step Random.Name.randomName (Random.initialSeed 0)
                    in
                    Expect.equal name "5-happy-monkeys"
            ]
        ]

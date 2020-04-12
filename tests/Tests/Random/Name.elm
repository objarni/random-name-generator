module Tests.Random.Name exposing (suite)

import Expect exposing (Expectation)
import Random
import Random.Name exposing (dimension, randomName)
import Test exposing (..)


suite : Test
suite =
    describe "random name generator library"
        [ describe "randomName"
            [ test "it will produce a nice dashed random name string" <|
                \() ->
                    let
                        ( name, _ ) =
                            Random.step Random.Name.randomName (Random.initialSeed 0)
                    in
                    Expect.equal name "2-enthusiastic-monkeys"
            ]
        , describe "randomNameFromSpace"
            [ test "it will produce a random name from given space" <|
                \() ->
                    let
                        starts =
                            dimension "1" "2" []

                        mids =
                            dimension "secret" "bewildered" [ "crazy", "mad" ]

                        ends =
                            dimension "aunty" "uncle" [ "grandma" ]

                        space =
                            { starts = starts, mids = mids, ends = ends }

                        generator =
                            Random.Name.randomNameFromSpace space

                        ( name, _ ) =
                            Random.step generator (Random.initialSeed 0)
                    in
                    Expect.equal name "1-secret-uncle"
            ]
        ]

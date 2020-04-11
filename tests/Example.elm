module Example exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import RandomNameGenerator exposing (dashConcatenator)
import Test exposing (..)


suite : Test
suite =
    describe "string dash concatenator"
        [ test "it will produce a dashed string" <|
            \_ ->
                let
                    words =
                        [ "5", "happy", "monkeys" ]

                    expected =
                        "5-happy-monkeys"
                in
                Expect.equal expected (dashConcatenator words)
        ]

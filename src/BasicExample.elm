module BasicExample exposing (main)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)
import Html.Attributes
import Random
import Random.Name exposing (randomName)


type alias Model =
    { name : String
    , seed : Random.Seed
    }


type Msg
    = RandomName


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = \model -> Sub.none
        }


init flags =
    ( { name = "initial value"
      , seed = Random.initialSeed 239846
      }
    , Cmd.none
    )


update msg model =
    let
        ( name, newSeed ) =
            Random.step randomName model.seed
    in
    case msg of
        RandomName ->
            ( { name = name, seed = newSeed }, Cmd.none )


view { name } =
    layout [ width fill, height fill ] <|
        column
            [ centerX, centerY, spacing 20, width (px 250) ]
            [ el [ centerX ] (text name)
            , Input.button
                [ Background.color (rgb255 238 238 238)
                , padding 10
                , centerX
                , focused [ Background.color (rgb255 238 0 238) ]
                ]
                { onPress = Just RandomName
                , label =
                    el
                        [ Font.center
                        , width (px 180)
                        ]
                        (text "Random name")
                }
            ]

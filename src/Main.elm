module Main exposing (main)

import Browser
import Html exposing (..)
import String exposing (fromChar)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
type Mark
    = Asterisk Char
    | Hash Char
    | Nothing

s : Mark
s = Asterisk '*'

h : Mark
h = Hash '#'

type alias Model =
    List(List(Mark))

getChar : Mark -> Char
getChar ch =
    case ch of
        Asterisk _ ->
            '*'
        Hash _ ->
            '#'
        Nothing ->
            ' '
init : Model
init =
    [[h, s, h], [h, h, s]]


type Msg
    = Msg1
    | Msg2


update : Msg -> Model -> Model
update msg model =
    case msg of
        Msg1 ->
            model

        Msg2 ->
            model

getStringFromMark : Mark -> String
getStringFromMark mark = fromChar (getChar mark)

getMarkList : Model -> List Mark
getMarkList marks =
    case marks of
        item::_ -> item
        [] -> []

getMarkFromList : List Mark -> Mark
getMarkFromList model =
    case model of
        item::_ -> item
        [] -> Nothing

getHtmlString input = text (getStringFromMark(getMarkFromList(getMarkList input)))
view : Model -> Html Msg
view model =
    let getMarks = map getHtmlString model
    in
    div []
        (getMarks)

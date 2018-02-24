-- To decode the JSON data, add this file to your project, run
-- 
--     elm-package install NoRedInk/elm-decode-pipeline
-- 
-- add these imports
-- 
--     import Json.Decode exposing (decodeString)`);
--     import QuickType exposing (reddit)
--
-- and you're off to the races with
--
--     decodeString reddit myJsonString

module QuickType exposing
    ( Reddit
    , redditToString
    , reddit
    )

import Json.Decode as Jdec
import Json.Decode.Pipeline as Jpipe
import Json.Encode as Jenc
import Dict exposing (Dict, map, toList)
import Array exposing (Array, map)

type alias Reddit =
    { message : String
    , error : Int
    }

-- decoders and encoders

redditToString : Reddit -> String
redditToString r = Jenc.encode 0 (encodeReddit r)

reddit : Jdec.Decoder Reddit
reddit =
    Jpipe.decode Reddit
        |> Jpipe.required "message" Jdec.string
        |> Jpipe.required "error" Jdec.int

encodeReddit : Reddit -> Jenc.Value
encodeReddit x =
    Jenc.object
        [ ("message", Jenc.string x.message)
        , ("error", Jenc.int x.error)
        ]

--- encoder helpers

makeArrayEncoder : (a -> Jenc.Value) -> Array a -> Jenc.Value
makeArrayEncoder f arr =
    Jenc.array (Array.map f arr)

makeDictEncoder : (a -> Jenc.Value) -> Dict String a -> Jenc.Value
makeDictEncoder f dict =
    Jenc.object (toList (Dict.map (\k -> f) dict))

makeNullableEncoder : (a -> Jenc.Value) -> Maybe a -> Jenc.Value
makeNullableEncoder f m =
    case m of
    Just x -> f x
    Nothing -> Jenc.null

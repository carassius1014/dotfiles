module Dotfiles.Handlers.GeneratePalette
    ( handler
    ) where

import Dotfiles.Prelude

import "JuicyPixels" Codec.Picture
    ( convertRGB8
    , readImage
    )
import "JuicyPixels" Codec.Picture.ColorQuant
    ( PaletteOptions (..)
    , defaultPaletteOptions
    , palettize
    )
import "JuicyPixels" Codec.Picture.Types
    ( Image (..)
    )
import "colour" Data.Colour.SRGB
    ( Colour
    , sRGB24
    , sRGB24show
    )
import "base" Data.List qualified as List
import "vector" Data.Vector.Storable qualified as StorableVector

handler :: FilePath -> IO ()
handler path = do
    dynImg <- either throwString pure =<< readImage path
    let rgb8Img = convertRGB8 dynImg
    let paletteOptions = defaultPaletteOptions{paletteColorCount = 8}
    let (_, palette) = palettize paletteOptions rgb8Img
    colors <-
        palette.imageData
            & StorableVector.toList
            & fmap Down
            & List.sort
            & fmap getDown
            & parseColors
            & either throwString pure

    forM_ colors (putStrLn . sRGB24show)

parseColors :: [Word8] -> Either String [Colour Double]
parseColors = go []
  where
    go acc = \case
        [] -> Right acc
        r : g : b : tail -> go (sRGB24 r g b : acc) tail
        _ -> Left "length raw color data couldn't be divided by 3"

import Dotfiles.Prelude

import Dotfiles.Handlers.GeneratePalette qualified as GeneratePalette
import Dotfiles.Options
    ( Options (..)
    , getOptions
    )

main :: IO ()
main = do
    options <- getOptions
    case options of
        GeneratePalette path -> GeneratePalette.handler path

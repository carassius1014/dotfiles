module Dotfiles.Options
    ( Options (..)
    , getOptions
    ) where

import Dotfiles.Prelude

import "optparse-generic" Options.Generic qualified as Options

getOptions :: IO Options
getOptions = Options.getRecord @_ @Options "dotfiles-cli"

data Options = GeneratePalette
    { image :: FilePath
    }
    deriving stock (Generic, Show)

instance Options.ParseRecord Options where
    parseRecord = Options.parseRecordWithModifiers Options.lispCaseModifiers

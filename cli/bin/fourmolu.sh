#!/usr/bin/env bash

fourmolu \
    --stdin-input-file "$HOME"/.dotfiles/cli/dotfiles-cli.cabal \
	  -o -XDerivingStrategies \
	  -o -XDerivingVia \
	  -o -XDuplicateRecordFields \
	  -o -XExplicitNamespaces \
	  -o -XFunctionalDependencies \
	  -o -XGHC2021 \
	  -o -XLambdaCase \
	  -o -XMultiWayIf \
	  -o -XNegativeLiterals \
	  -o -XNoFieldSelectors \
	  -o -XNoImplicitPrelude \
	  -o -XOverloadedRecordDot \
	  -o -XOverloadedStrings \
	  -o -XPackageImports \
	  -o -XRecordWildCards \
	  -o -XStrict \
    2>/dev/null

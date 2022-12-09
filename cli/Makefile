hpack:
	hpack

build: hpack
	cabal build ${target}

format: hpack
	git ls-files "*.hs" | xargs fourmolu --mode inplace

ghcid: hpack
	ghcid \
		-c "cabal repl ${target}" \
		--no-height-limit \
		--reverse-errors \
		--clear

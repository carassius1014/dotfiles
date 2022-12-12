hpack:
	hpack
	cabal freeze

build: hpack
	cabal build ${target}

repl: hpack
	ghcid -c "cabal repl ${target}"

format: hpack
	git ls-files "*.hs" | xargs fourmolu --mode inplace

ghcid: hpack
	ghcid \
		-c "cabal repl ${target}" \
		--no-height-limit \
		--reverse-errors \
		--clear

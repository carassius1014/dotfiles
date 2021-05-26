all:

.PHONY: format
format:
	git ls-files "*.nix" | xargs nixfmt

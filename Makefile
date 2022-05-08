all:

heitor.rebuild:
	sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --impure --flake .

miguel.rebuild:
	sudo darwin-rebuild switch --flake .
	rm -f ./result

format:
	git ls-files "*.nix" | xargs nixfmt

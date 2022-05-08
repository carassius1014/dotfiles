all:

heitor.rebuild:
	sudo NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --impure --flake .

miguel.build:
	nix build .#darwinConfigurations.miguel.system

miguel.apply:
	sudo ./result/sw/bin/darwin-rebuild switch --flake .
	rm -f ./result

format:
	git ls-files "*.nix" | xargs nixfmt

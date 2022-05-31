all:

heitor.rebuild:
	NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --use-remote-sudo --impure --flake .

heitor.rebuild.force:
	NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --use-remote-sudo --install-bootloader --impure --flake .

miguel.rebuild:
	sudo darwin-rebuild switch --flake .
	rm -f ./result

format:
	git ls-files "*.nix" | xargs nixfmt

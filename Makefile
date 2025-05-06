all:

nixos.rebuild:
	NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --use-remote-sudo --impure --flake .#${host}

nixos.rebuild.force:
	NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --use-remote-sudo --install-bootloader --impure --flake .#${host}

heitor.rebuild:
	@make host=heitor nixos.rebuild

heitor.rebuild.force:
	@make host=heitor nixos.rebuild.force

miguel.rebuild:
	darwin-rebuild switch --flake .
	rm -f ./result

roland.rebuild:
	@make host=roland nixos.rebuild

roland.rebuild.force:
	@make host=roland nixos.rebuild.force

doom.reinstall:
	rm -rf emacs.d
	git clone --depth 1 https://github.com/doomemacs/doomemacs emacs.d
	doom install

format:
	git ls-files "*.nix" | xargs nix fmt

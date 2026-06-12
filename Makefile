all:

nixos.rebuild:
	NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --sudo --impure --flake .#${host}

nixos.rebuild.force:
	NIXPKGS_ALLOW_UNFREE=1 nixos-rebuild switch --sudo --install-bootloader --impure --flake .#${host}

heitor.bump-up:
	nix flake update \
		claude-code \
		codex \
		home-manager \
		nixpkgs \
		nix-colors \
		nix-doom-emacs-unstraightened \
		nur \
		prisma-utils

heitor.rebuild:
	@make host=heitor nixos.rebuild

heitor.rebuild.force:
	@make host=heitor nixos.rebuild.force

miguel.rebuild:
	darwin-rebuild switch --flake .
	rm -f ./result

format:
	git ls-files "*.nix" | xargs nix fmt
	git ls-files "*.el" | xargs ./bin/format-elisp.sh

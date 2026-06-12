{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-25.11-darwin";

    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nur.url = "github:nix-community/NUR";

    codex.url = "github:herp-inc-hq/codex/release-25.11";

    nix-colors.url = "github:misterio77/nix-colors";

    prisma-utils.url = "github:VanCoding/nix-prisma-utils";

    mac-app-util.url = "github:hraban/mac-app-util";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    claude-code.url = "github:sadjow/claude-code-nix";

    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations =
      let
        system = "x86_64-linux";
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            (import ./hosts/common/overlays/context.nix)
            inputs.claude-code.overlays.default
          ];
        };
      in
      {
        heitor = import ./hosts/heitor (inputs // { inherit pkgs system; });
      };

    darwinConfigurations =
      let
        system = "aarch64-darwin";
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            (import ./hosts/common/overlays/context.nix)
            inputs.claude-code.overlays.default
          ];
        };
      in
      {
        GTPC22013 = import ./hosts/miguel (
          inputs
          // {
            inherit pkgs system;
            mac-app-util = inputs.mac-app-util;
          }
        );
        GTPC26001 = import ./hosts/miguel (
          inputs
          // {
            inherit pkgs system;
            mac-app-util = inputs.mac-app-util;
          }
        );
      };

    devShells =
      (inputs.codex.lib.eachSystem { inherit inputs; } (
        { pkgs, ... }:
        {
          devShells.default = pkgs.mkShell { buildInputs = [ ]; };
        }
      )).devShells;

    formatter =
      (inputs.codex.lib.eachSystem { inherit inputs; } (
        { pkgs, ... }:
        {
          formatter = pkgs.nixfmt-rfc-style;
        }
      )).formatter;
  };
}

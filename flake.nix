{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-26.05-darwin";

    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-26.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nur.url = "github:nix-community/NUR";

    codex.url = "github:herp-inc-hq/codex/release-25.11";

    nix-colors.url = "github:misterio77/nix-colors";

    mac-app-util.url = "github:hraban/mac-app-util";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    llm-agents.url = "github:numtide/llm-agents.nix";

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
            inputs.llm-agents.overlays.default
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
            inputs.llm-agents.overlays.default
          ];
        };
      in
      {
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

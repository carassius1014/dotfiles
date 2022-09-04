{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    flake-utils.url = "github:numtide/flake-utils";
    flake-utils.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, flake-utils, ... }: {
    nixosConfigurations = {
      heitor = import ./hosts/heitor { inherit nixpkgs home-manager; };
      roland = import ./hosts/roland { inherit nixpkgs home-manager; };
    };

    darwinConfigurations = {
      GTPC22013 = import ./hosts/miguel { inherit nixpkgs darwin home-manager; };
    };

    devShell = (flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        shell = pkgs.mkShell { buildInputs = with pkgs; [ nixfmt ]; };
      })).shell;
  };
}

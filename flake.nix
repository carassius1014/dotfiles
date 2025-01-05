{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nur.url = "github:nix-community/NUR";

    codex.url = "github:herp-inc-hq/codex";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, codex, ... }@inputs: {
    nixosConfigurations = let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import ./hosts/common/overlays/context.nix) ];
      };
    in {
      heitor = import ./hosts/heitor (inputs // { inherit pkgs system; });
      roland = import ./hosts/roland (inputs // { inherit pkgs system; });
    };

    darwinConfigurations = let
      system = "aarch64-darwin";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ (import ./hosts/common/overlays/context.nix) ];
      };
    in {
      GTPC22013 = import ./hosts/miguel (inputs // { inherit pkgs system; });
    };

    devShell = (codex.lib.eachSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        shell = pkgs.mkShell { buildInputs = with pkgs; [ nixfmt ]; };
      })).shell;
  };
}

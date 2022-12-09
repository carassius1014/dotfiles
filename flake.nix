{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-22.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-22.11-darwin";

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    codex.url = "github:herp-inc/codex";
  };

  outputs = { self, nixpkgs, codex, ... }@inputs: {
    nixosConfigurations = {
      heitor = import ./hosts/heitor inputs;
      roland = import ./hosts/roland inputs;
    };

    darwinConfigurations = { GTPC22013 = import ./hosts/miguel inputs; };

    devShell = (codex.eachSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        ghcVersion = "ghc925";
        dotfiles-cli = import ./cli { inherit pkgs ghcVersion; };
      in {
        shell = pkgs.mkShell {
          buildInputs = with pkgs; [
            cabal-install
            dotfiles-cli
            ghcid
            pkgs.haskell.compiler.${ghcVersion}
            haskell.packages.${ghcVersion}.fourmolu
            hpack
            nixfmt
          ];
        };
      })).shell;
  };
}

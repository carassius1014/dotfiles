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

    nur.url = "github:nix-community/NUR";

    codex.url = "github:herp-inc/codex";

    nix-colors.url = "github:misterio77/nix-colors";

    cli = {
      url = "path:./cli";
      flake = false;
    };
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

    devShell = (codex.eachSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        ghcVersion = "ghc925";
        dotfiles-cli = import inputs.cli { inherit pkgs ghcVersion; };
      in {
        shell = pkgs.mkShell {
          buildInputs = with pkgs;
            [ nixfmt ] ++ lib.lists.optionals (system == "x86_64-linux") [
              cabal-install
              dotfiles-cli
              ghcid
              haskell.compiler.${ghcVersion}
              haskell.packages.${ghcVersion}.fourmolu
              hpack
              zlib
            ];
        };
      })).shell;
  };
}

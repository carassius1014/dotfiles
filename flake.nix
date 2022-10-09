{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";

    home-manager.url = "github:nix-community/home-manager/release-22.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    codex.url = "github:herp-inc/codex";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, codex, ... }: {
    nixosConfigurations = {
      heitor = import ./hosts/heitor { inherit nixpkgs home-manager; };
      roland = import ./hosts/roland { inherit nixpkgs home-manager; };
    };

    darwinConfigurations = {
      GTPC22013 =
        import ./hosts/miguel { inherit nixpkgs darwin home-manager codex; };
    };

    devShell = (codex.eachSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        shell = pkgs.mkShell { buildInputs = with pkgs; [ nixfmt ]; };
      })).shell;
  };
}

{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    darwin.url = "github:lnl7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, darwin, ... }: {
    nixosConfigurations = {
      heitor = import ./hosts/heitor { inherit nixpkgs home-manager; };
    };

    darwinConfigurations = {
      miguel = import ./hosts/miguel { inherit nixpkgs darwin home-manager; };
    };

    devShell = {
      x86_64-linux = let pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in pkgs.mkShell { buildInputs = with pkgs; [ nixfmt ]; };

      aarch64-darwin = let pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      in pkgs.mkShell { buildInputs = with pkgs; [ nixfmt ]; };
    };
  };
}

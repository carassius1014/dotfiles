{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      heitor = import ./hosts/heitor { inherit nixpkgs home-manager; };
    };

    devShell.x86_64-linux = let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in pkgs.mkShell { buildInputs = with pkgs; [ nixfmt ]; };
  };
}

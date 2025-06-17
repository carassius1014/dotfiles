{
  description = "dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";

    darwin = {
      url = "github:lnl7/nix-darwin/nix-darwin-25.05";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nur.url = "github:nix-community/NUR";

    codex.url = "github:herp-inc-hq/codex";

    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = inputs: {
    nixosConfigurations =
      let
        system = "x86_64-linux";
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ (import ./hosts/common/overlays/context.nix) ];
        };
      in
      {
        heitor = import ./hosts/heitor (inputs // { inherit pkgs system; });
        roland = import ./hosts/roland (inputs // { inherit pkgs system; });
      };

    darwinConfigurations =
      let
        system = "aarch64-darwin";
        pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ (import ./hosts/common/overlays/context.nix) ];
        };
      in
      {
        GTPC22013 = import ./hosts/miguel (inputs // { inherit pkgs system; });
      };

    devShell =
      (inputs.codex.lib.eachSystem (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        {
          shell = pkgs.mkShell { buildInputs = [ ]; };
        }
      )).shell;

    formatter =
      (inputs.codex.lib.eachSystem (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        {
          fmt = pkgs.nixfmt-rfc-style;
        }
      )).fmt;
  };
}

{ nixpkgs, pkgs, system, home-manager, nur, nix-colors, codex, ... }:

let
  ctx-overlay = import ./overlays/context.nix { inherit nix-colors; };
  inherit (pkgs) gctx;
in nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    ./configuration.nix

    nur.nixosModules.nur

    home-manager.nixosModules.home-manager
    {
      nixpkgs.overlays = [ ctx-overlay nur.overlay ];
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${gctx.me.name} = import ./home.nix {
        inherit pkgs;
        codexHmModule = codex.hmModule.${system};
      };
    }
  ];
}

{
  codex,
  home-manager,
  nix-colors,
  nixpkgs,
  nur,
  pkgs,
  prisma-utils,
  system,
  ...
}:

let
  ctx-overlay = import ./overlays/context.nix { inherit nix-colors; };
  inherit (pkgs) gctx;
in
nixpkgs.lib.nixosSystem {
  inherit system;

  modules = [
    ./configuration.nix

    nur.modules.nixos.default

    home-manager.nixosModules.home-manager
    {
      nixpkgs.overlays = [
        ctx-overlay
        nur.overlays.default
      ];
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${gctx.me.name} = import ./home.nix {
        inherit pkgs;
        inherit (prisma-utils.lib) prisma-factory;
        codexHmModule = codex.hmModule.${system};
      };
    }
  ];
}

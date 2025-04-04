{
  nixpkgs,
  pkgs,
  pkgs-unstable,
  system,
  home-manager,
  nur,
  nix-colors,
  codex,
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
      home-manager.extraSpecialArgs = { inherit pkgs-unstable; };
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${gctx.me.name} = import ./home.nix {
        inherit pkgs pkgs-unstable;
        codexHmModule = codex.hmModule.${system};
      };
    }
  ];
}

{
  nixpkgs,
  pkgs,
  system,
  home-manager,
  ...
}:

let
  inherit (pkgs) gctx;
in
nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    ./configuration.nix
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${gctx.me.name} = import ./home.nix { inherit pkgs; };
    }
  ];
}

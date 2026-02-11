{
  pkgs,
  system,
  darwin,
  home-manager,
  codex,
  mac-app-util,
  ...
}:

let
  inherit (pkgs) gctx;
in
darwin.lib.darwinSystem {
  inherit system;
  modules = [
    ./configuration.nix
    mac-app-util.darwinModules.default
    home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "backup";
      home-manager.users.${gctx.me.name} = import ./home.nix {
        inherit pkgs mac-app-util;
        codexHmModule = codex.hmModule.aarch64-darwin;
      };
    }
  ];
}

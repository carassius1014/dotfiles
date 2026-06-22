{
  pkgs,
  system,
  darwin,
  home-manager,
  codex,
  mac-app-util,
  nix-doom-emacs-unstraightened,
  nix-homebrew,
  homebrew-cask,
  ...
}:

let
  inherit (pkgs) gctx;
in
darwin.lib.darwinSystem {
  inherit system;
  specialArgs = { inherit homebrew-cask; };
  modules = [
    ./configuration.nix
    mac-app-util.darwinModules.default
    home-manager.darwinModules.home-manager
    nix-homebrew.darwinModules.nix-homebrew
    {
      nixpkgs.overlays = [
        codex.overlays.default
        # codex pins nix_2_33, removed in nixpkgs 26.05; override to the successor
        (_: prev: { nix = prev.nixVersions.nix_2_34; })
      ];
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.backupFileExtension = "backup";
      home-manager.users.${gctx.me.name} = import ./home.nix {
        inherit pkgs mac-app-util;
        codexHmModule = codex.homeModules.default;
        doomEmacsHmModule = nix-doom-emacs-unstraightened.homeModule;
      };
    }
  ];
}

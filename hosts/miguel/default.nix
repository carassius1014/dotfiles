{ nixpkgs, darwin, home-manager, codex, ... }:

let
  system = "aarch64-darwin";
  pkgs = nixpkgs.legacyPackages.${system};
  gctx = import ../context.nix { inherit pkgs; };
in darwin.lib.darwinSystem {
  inherit system;
  modules = [
    ./configuration.nix
    home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${gctx.me.name} = import ./home.nix {
        inherit pkgs;
        codexHmModule = codex.hmModule.aarch64-darwin;
      };
    }
  ];
}

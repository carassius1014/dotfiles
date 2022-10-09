{ nixpkgs, darwin, home-manager, codex }:

darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  modules = [
    ./configuration.nix
    home-manager.darwinModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.carassius1014 = let
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        codexHmModule = codex.hmModule.aarch64-darwin;
      in import ./home.nix { inherit pkgs codexHmModule; };
    }
  ];
}

{ nixpkgs, home-manager, emacs-overlay, codex, ... }:

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    home-manager.nixosModules.home-manager
    {
      nixpkgs.overlays = [ emacs-overlay.overlay ];
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.carassius1014 = let
        sys = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${sys};
        codexHmModule = codex.hmModule.${sys};
      in import ./home.nix { inherit pkgs codexHmModule; };
    }
  ];
}

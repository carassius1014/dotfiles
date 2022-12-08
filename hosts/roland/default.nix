{ nixpkgs, home-manager, ... }:

nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    ./configuration.nix
    home-manager.nixosModules.home-manager
    {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.carassius1014 =
        let pkgs = nixpkgs.legacyPackages.x86_64-linux;
        in import ./home.nix { inherit pkgs; };
    }
  ];
}

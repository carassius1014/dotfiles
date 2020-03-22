let
  nixpkgs = import ./channels/nixos.nix ;
in
{
  allowUnfree = true;
  packageOverrides = pkgs: {
    macosPackages = pkgs.buildEnv {
      name = "macos-packages";
      paths = [
      ];
    };
    nixosPackages = with nixpkgs; buildEnv {
      name = "nixos-packages";
      paths = [
        direnv
        docker-compose
        ghcid
        google-chrome
        haskellPackages.brittany
        haskellPackages.hoogle
        stack
      ];
    };
  };
}

let
  nixpkgs = import ./channels/nixos.nix ;
in
{
  allowUnfree = true;
  packageOverrides = pkgs: {
    macosPackages = with nixpkgs; buildEnv {
      name = "macos-packages";
      paths = [
        coq
        stack
        ghcid
        haskellPackages.brittany
        haskellPackages.hoogle
      ];
    };
    nixosPackages = with nixpkgs; buildEnv {
      name = "nixos-packages";
      paths = [
        coq
        direnv
        docker-compose
        ghcid
        google-chrome
        haskellPackages.brittany
        haskellPackages.hoogle
        nodejs
        stack
        unzip
        wine
        winetricks
        yarn
      ];
    };
  };
}

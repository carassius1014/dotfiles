let
  nixos = import ./channels/nixos.nix ;
in
{
  allowUnfree = true;
  packageOverrides = pkgs: {
    macosPackages = with nixos; buildEnv {
      name = "macos-packages";
      paths = [
        coq
        ghcid
        haskellPackages.brittany
        haskellPackages.hoogle
        stack
      ];
    };
    nixosPackages = with nixos; buildEnv {
      name = "nixos-packages";
      paths = [
        coq
        direnv
        docker-compose
        evince
        ghcid
        google-chrome
        graphviz
        haskellPackages.brittany
        haskellPackages.hoogle
        musescore
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

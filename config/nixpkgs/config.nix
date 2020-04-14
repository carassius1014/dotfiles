let
  darwin = import ./channels/darwin.nix;
  nixos = import ./channels/nixos.nix;
  nixpkgs = import ./channels/nixpkgs.nix;
in
{
  allowUnfree = true;
  packageOverrides = pkgs: {
    commonPackages = with nixpkgs; buildEnv {
      name = "common-packages";
      paths = [
        coq
        ghcid
        haskellPackages.brittany
        haskellPackages.hoogle
        stack
      ];
    };
    macosPackages = with darwin; buildEnv {
      name = "macos-packages";
      paths = [
      ];
    };
    nixosPackages = with nixos; buildEnv {
      name = "nixos-packages";
      paths = [
        awscli
        direnv
        docker-compose
        evince
        google-chrome
        graphviz
        musescore
        nodejs
        saml2aws
        unzip
        wine
        winetricks
        yarn
      ];
    };
  };
}

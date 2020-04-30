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
        hugo
        multimarkdown
        python37Packages.pygments
        ormolu
        stack
        tree
      ];
    };
    macosPackages = with darwin; buildEnv {
      name = "macos-packages";
      paths = [
        haskellPackages.hoogle
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
        haskellPackages.brittany
        haskellPackages.hoogle
        musescore
        nodejs
        saml2aws
        texlive.combined.scheme-full
        unzip
        wine
        winetricks
        yarn
      ];
    };
  };
}

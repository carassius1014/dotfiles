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
        fstar
        hugo
        multimarkdown
        python37Packages.pygments
        ocaml
        ocamlPackages.dune
        ocamlPackages.utop
        ormolu
        stack
        tree
        z3
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

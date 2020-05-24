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
        awscli
        coq
        direnv
        ghcid
        fstar
        haskellPackages.hoogle
        hugo
        idris
        multimarkdown
        python37Packages.pygments
        ocaml
        ocamlPackages.dune
        ocamlPackages.utop
        ormolu
        saml2aws
        shadowsocks-libev
        stack
        tree
        z3
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
        docker-compose
        evince
        google-chrome
        graphviz
        haskellPackages.brittany
        musescore
        nodejs
        openjdk
        texlive.combined.scheme-full
        unzip
        wine
        winetricks
        yarn
      ];
    };
  };
}

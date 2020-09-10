let
  darwin = import ./channels/darwin.nix;
  nixos = import ./channels/nixos.nix;

  haskell-pkgs = import ./packages/haskell.nix { pkgs = nixos; };
  ocaml-pkgs = import ./packages/ocaml.nix { pkgs = nixos; };
  python-pkgs = import ./packages/python.nix { pkgs = nixos; };
in {
  allowUnfree = true;
  packageOverrides = pkgs: {
    commonPackages = with nixos;
      buildEnv {
        name = "common-packages";
        paths = [
          awscli
          chez
          coq
          direnv
          ghcid
          fd
          fstar
          haskell-pkgs
          hugo
          idris
          jq
          multimarkdown
          ocaml
          ocaml-pkgs
          pandoc
          pipenv
          purescript
          python-pkgs
          ripgrep
          rustup
          saml2aws
          shadowsocks-libev
          shellcheck
          spago
          stack
          tree
          z3
        ];
      };
    macosPackages = with darwin;
      buildEnv {
        name = "macos-packages";
        paths = [ nixfmt fish ];
      };
    nixosPackages = with nixos;
      buildEnv {
        name = "nixos-packages";
        paths = [
          docker-compose
          evince
          google-chrome
          graphviz
          haskellPackages.brittany
          musescore
          nodejs
          okular
          openjdk
          pdftk
          racket
          rlwrap
          symbola
          texlive.combined.scheme-full
          unrar
          unzip
          vscode
          wine
          winetricks
          yarn
        ];
      };
  };
}

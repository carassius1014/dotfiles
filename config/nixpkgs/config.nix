let

  nixpkgs = import ./channels/nixpkgs.nix;
  darwin = import ./channels/darwin.nix;
  nixos = import ./channels/nixos.nix;

  haskell-pkgs = import ./packages/haskell.nix { pkgs = nixpkgs; };
  ocaml-pkgs = import ./packages/ocaml.nix { pkgs = nixpkgs; };
  python-pkgs = import ./packages/python.nix { pkgs = nixpkgs; };
in {
  allowUnfree = true;
  packageOverrides = pkgs: {
    commonPackages = with nixpkgs;
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
          quartus-prime-lite
          racket
          rlwrap
          steam
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

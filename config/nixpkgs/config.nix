let

  nixpkgs = import ./channels/nixpkgs.nix;
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
          cargo-generate
          chez
          coq
          deno
          direnv
          ghcid
          fd
          fstar
          haskell-pkgs
          httpie
          hugo
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
          stack
          tree
          z3
        ];
      };
    macosPackages = with nixpkgs;
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
          p7zip
          pdftk
          postgresql
          racket
          rlwrap
          steam
          symbola
          texlive.combined.scheme-full
          unrar
          unzip
          wine
          winetricks
          yarn
        ];
      };
  };
}

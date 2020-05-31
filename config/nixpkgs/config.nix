let
  darwin = import ./channels/darwin.nix;
  nixos = import ./channels/nixos.nix;
  nixpkgs = import ./channels/nixpkgs.nix;

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
          coq
          direnv
          ghcid
          fd
          fstar
          haskell-pkgs
          hugo
          idris
          multimarkdown
          ocaml
          ocaml-pkgs
          pipenv
          python38
          python-pkgs
          ripgrep
          saml2aws
          shadowsocks-libev
          shellcheck
          stack
          tree
          z3
        ];
      };
    macosPackages = with darwin;
      buildEnv {
        name = "macos-packages";
        paths = [ nixfmt ];
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
          openjdk
          texlive.combined.scheme-full
          unzip
          vscode
          wine
          winetricks
          yarn
        ];
      };
  };
}

let pkgs = import ../../.dotfiles/nix/pkgs.nix;
in {
  allowUnfree = true;
  packageOverrides = _: {
    homePackages = with pkgs;
      buildEnv {
        name = "home-packages";
        paths = [
          awscli
          coq
          direnv
          dhall
          docker-compose
          evince
          gh
          google-chrome
          graphviz
          fd
          fzf
          haskellPackages.hoogle
          httpie
          jq
          multimarkdown
          musescore
          niv
          nixfmt
          nodejs
          okular
          p7zip
          pdftk
          python38Packages.editorconfig
          ripgrep
          rlwrap
          saml2aws
          shellcheck
          stack
          steam
          symbola
          texlive.combined.scheme-full
          tree
          unrar
          unzip
        ];
      };
  };
}

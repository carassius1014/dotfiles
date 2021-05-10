let
  pkgs = import ../../.dotfiles/nix/pkgs.nix;
in {
  allowUnfree = true;
  packageOverrides = _: {
    homePackages = with pkgs;
      buildEnv {
        name = "home-packages";
        paths = [
          awscli
          direnv
          docker-compose
          evince
          google-chrome
          graphviz
          fd
          httpie
          jq
          multimarkdown
          musescore
          niv
          nixfmt
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

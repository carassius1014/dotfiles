let

  pkgs = import ./channels/nixpkgs.nix;
in {
  allowUnfree = true;
  packageOverrides = pkgs: {
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

{ pkgs }:

{
  imports = [ ../common/home/programs ../common/home/programs/git.nix ];

  home = {
    username = "carassius1014";
    homeDirectory = "/home/carassius1014";

    packages = with pkgs; [
      awscli
      coq
      direnv
      dhall
      docker-compose
      evince
      gh
      ghcid
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

    stateVersion = "22.05";
  };
}

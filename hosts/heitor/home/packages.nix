{ pkgs, ... }:

{
  home.packages = with pkgs; [
    black
    cabal-install
    dig
    direnv
    graphviz
    fd
    fzf
    httpie
    libnotify
    nix-prefetch-git
    nodejs
    okular
    p7zip
    plantuml
    pdftk
    python310
    python310Packages.editorconfig
    ripgrep
    rlwrap
    saml2aws
    shellcheck
    steam
    symbola
    texlive.combined.scheme-full
    tree
    unrar
    unzip
    whois
    xdg-utils
    yarn
  ];
}

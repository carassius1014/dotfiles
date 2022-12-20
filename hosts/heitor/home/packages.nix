{ pkgs, ... }:

{
  home.packages = with pkgs; [
    black
    dig
    direnv
    graphviz
    fd
    fzf
    haskellPackages.hoogle
    httpie
    jq
    libnotify
    nix-prefetch-git
    nodejs
    okular
    p7zip
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
  ];
}

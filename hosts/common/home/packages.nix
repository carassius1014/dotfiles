{ pkgs, pkgs-unstable }:

let
  normalPackages = with pkgs; [
    black
    editorconfig-core-c
    dig
    direnv
    gnupg
    graphviz
    fd
    fzf
    httpie
    ngrok
    nix-prefetch-git
    nodejs-slim
    p7zip
    poetry
    python3Minimal
    ripgrep
    rlwrap
    saml2aws
    shellcheck
    tree
    unrar
    unzip
    whois
  ];
  unstablePackages = with pkgs-unstable; [
    bun
    code-cursor
    nodejs-slim
  ];
in
normalPackages ++ unstablePackages

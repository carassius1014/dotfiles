{ pkgs, pkgs-unstable, ... }:

{
  home.packages =
    let
      haskellPackages = (import ../../common/home/packages.nix { inherit pkgs; }).haskellPackages;
      unstablePackages = with pkgs-unstable; [ code-cursor ];
    in
    with pkgs;
    [
      adwaita-icon-theme
      black
      cabal-install
      dig
      direnv
      gnupg
      graphviz
      fd
      fzf
      httpie
      libnotify
      ngrok
      nix-prefetch-git
      nodejs
      okular
      p7zip
      python310
      python310Packages.editorconfig
      ripgrep
      rlwrap
      saml2aws
      shellcheck
      steam
      symbola
      tree
      unrar
      unzip
      whois
      xdg-utils
      yarn
    ]
    ++ haskellPackages
    ++ unstablePackages;
}

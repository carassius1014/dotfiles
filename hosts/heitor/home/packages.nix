{ pkgs, ... }:

{
  home.packages = with pkgs;
    let ghcVersion = "ghc927";
    in [
      black
      cabal-install
      dig
      direnv
      graphviz
      fd
      fzf
      haskell.compiler.${ghcVersion}
      haskell.packages.${ghcVersion}.fourmolu
      haskell.packages.${ghcVersion}.ghcid
      haskell.packages.${ghcVersion}.hoogle
      httpie
      jq
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

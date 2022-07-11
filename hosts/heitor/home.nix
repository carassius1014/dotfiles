{ pkgs }:

{
  imports = [
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/fish.nix
    ../common/home/programs/gh.nix
    ../common/home/programs/git.nix
  ];

  home = {
    username = "carassius1014";
    homeDirectory = "/home/carassius1014";

    packages = with pkgs; [
      black
      direnv
      google-chrome
      graphviz
      fd
      fzf
      haskellPackages.hoogle
      httpie
      jq
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
    ];

    stateVersion = "22.05";
  };
}

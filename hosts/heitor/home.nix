{ pkgs, codexHmModule }:

{
  imports = [
    codexHmModule

    ../common/home/codex.nix
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/fish.nix
    ../common/home/programs/gh.nix
    ../common/home/programs/git.nix

    ./home/alacritty.nix
    ./home/fcitx5.nix
  ];

  home = {
    username = "carassius1014";
    homeDirectory = "/home/carassius1014";

    packages = with pkgs; [
      black
      dig
      direnv
      google-chrome
      graphviz
      fd
      fzf
      haskellPackages.hoogle
      httpie
      jq
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
    ];

    stateVersion = "22.05";
  };
}

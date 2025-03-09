{ pkgs, codexHmModule, ... }:

{
  imports = [
    codexHmModule
    ../common/home/codex.nix
    ../common/home/emacs.nix
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/gh.nix
    ../common/home/programs/git.nix
    ../common/home/programs/zsh.nix
  ];

  home = {
    packages = with pkgs; [
      cachix
      nodejs
      python310Packages.editorconfig
      ripgrep
      tree
      yarn
      zstd
    ];

    stateVersion = "22.05";
  };
}

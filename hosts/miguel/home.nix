{ pkgs, codexHmModule, ... }:

{
  imports = [
    codexHmModule
    ../common/home/codex.nix
    ../common/home/emacs.nix
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/fish.nix
    ../common/home/programs/gh.nix
    ../common/home/programs/git.nix
  ];

  home = {
    packages = with pkgs; [
      cachix
      nixfmt
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

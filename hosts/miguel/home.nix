{ pkgs, ... }:

{
  imports = [
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/fish.nix
    ../common/home/programs/git.nix
    ../common/home/programs/kitty.nix
  ];

  home.packages = with pkgs; [
    gh
    jq
    python310Packages.editorconfig
    ripgrep
  ];
}

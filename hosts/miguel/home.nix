{ pkgs, ... }:

{
  imports = [
    ../common/home/programs
  # ../common/home/programs/direnv.nix
    ../common/home/programs/fish.nix
    ../common/home/programs/git.nix
  ];

  home.packages = with pkgs; [ gh jq nix-direnv-flakes python310Packages.editorconfig ripgrep ];
}

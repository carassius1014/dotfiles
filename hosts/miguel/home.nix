{ pkgs, ... }:

{
  imports = [
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/fish.nix
    ../common/home/programs/gh.nix
    ../common/home/programs/git.nix
  ];

  home = {
    packages = with pkgs; [ jq nixfmt python310Packages.editorconfig ripgrep ];

    stateVersion = "22.05";
  };
}

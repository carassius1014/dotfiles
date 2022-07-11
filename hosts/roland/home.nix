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

    packages = with pkgs; [ httpie jq python310 ];

    stateVersion = "22.05";
  };
}

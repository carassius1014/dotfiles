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

    ./home/emacs.nix
    ./home/fcitx5.nix
    ./home/kitty.nix
    ./home/mako.nix
    ./home/packages.nix
    ./home/rofi.nix
    ./home/sway.nix
    ./home/waybar
  ];

  home = {
    username = "carassius1014";
    homeDirectory = "/home/carassius1014";

    stateVersion = "22.05";
  };
}

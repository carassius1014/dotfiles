{ pkgs, codexHmModule }:

let gctx = import ../context.nix { inherit pkgs; };
in {
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
    ./home/firefox.nix
    ./home/kitty.nix
    ./home/mako.nix
    ./home/packages.nix
    ./home/rofi.nix
    ./home/sway.nix
    ./home/waybar
  ];

  home = {
    username = gctx.me.name;
    homeDirectory = "/home/${gctx.me.name}";

    stateVersion = "22.05";
  };
}

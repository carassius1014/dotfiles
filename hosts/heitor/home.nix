{
  pkgs,
  pkgs-unstable,
  codexHmModule,
}:

let
  inherit (pkgs) gctx;
in
{
  imports = [
    codexHmModule

    ../common/home/codex.nix
    ../common/home/emacs.nix
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/git.nix
    ../common/home/programs/zsh.nix

    ./home/fcitx5.nix
    ./home/firefox.nix
    ./home/google-chrome.nix
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

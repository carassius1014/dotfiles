{
  codexHmModule,
  doomEmacsHmModule,
  pkgs,
}:

let
  inherit (pkgs) gctx;
in
{
  imports = [
    codexHmModule
    doomEmacsHmModule

    ../common/home/codex.nix
    ../common/home/emacs.nix
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/git
    ../common/home/programs/git/company.nix

    (import ../common/home/programs/zsh.nix {
      inherit pkgs;
    })

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

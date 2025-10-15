{
  codexHmModule,
  pkgs,
  prisma-factory,
}:

let
  inherit (pkgs) gctx;
  prisma = import ./packages/prisma.nix { inherit pkgs prisma-factory; };
in
{
  imports = [
    codexHmModule

    ../common/home/codex.nix
    ../common/home/emacs.nix
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/git
    ../common/home/programs/git/company.nix

    (import ../common/home/programs/zsh.nix {
      inherit pkgs;
      inherit (prisma) shellHook;
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

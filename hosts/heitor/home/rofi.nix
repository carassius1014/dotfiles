{ pkgs, ... }:

let inherit (pkgs) ctx gctx;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    inherit (ctx) terminal;
    font = "${gctx.fonts.ui} 14";

    extraConfig = {
      run-command = "zsh -c '{cmd}'";
      run-list-command = "zsh -c functions";
    };
  };
}

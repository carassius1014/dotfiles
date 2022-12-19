{ pkgs, ... }:

let
  ctx = import ../context.nix { inherit pkgs; };
  gctx = import ../../context.nix { inherit pkgs; };
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    inherit (ctx) terminal;
    font = "${gctx.fonts.ui} 14";

    extraConfig = {
      run-command = "fish -c '{cmd}'";
      run-list-command = "fish -c functions";
    };
  };
}

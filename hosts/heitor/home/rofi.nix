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
  };
}

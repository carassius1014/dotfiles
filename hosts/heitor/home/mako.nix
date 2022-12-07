{ pkgs, ... }:

let
  ctx = import ../context.nix { inherit pkgs; };
  gctx = import ../../context.nix { inherit pkgs; };
in {
  programs.mako = {
    enable = true;
    font = "${gctx.fonts.ui} 14";
    output = ctx.monitors.dell-U2720QM;
  };
}

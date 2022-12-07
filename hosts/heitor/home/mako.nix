{ pkgs, ... }:

let gctx = import ../../context.nix { inherit pkgs; };
in {
  programs.mako = {
    enable = true;
    font = "${gctx.fonts.ui} 14";
  };
}

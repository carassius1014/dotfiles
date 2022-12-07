{ pkgs, ... }:

let gctx = import ../../context.nix { inherit pkgs; };
in {
  programs.kitty = {
    enable = true;
    font = {
      package = gctx.fonts.package;
      name = gctx.fonts.term;
      size = 14;
    };
  };
}

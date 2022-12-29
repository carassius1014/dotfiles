{ pkgs, ... }:

let inherit (pkgs) ctx gctx;
in {
  programs.mako = {
    enable = true;
    font = "${gctx.fonts.ui} 14";
    output = ctx.monitors.dell-U2720QM;
  };
}

{ pkgs, ... }:

let
  inherit (pkgs) ctx gctx;
in
{
  services.mako = {
    enable = true;
    settings = {
      font = "${gctx.fonts.ui} 14";
      output = ctx.monitors.dell-U2720QM;
    };
  };
}

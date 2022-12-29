{ pkgs, ... }:

let inherit (pkgs) gctx;
in {
  programs.kitty = {
    enable = true;
    font = {
      package = gctx.fonts.package;
      name = gctx.fonts.term;
      size = 14;
    };

    settings = {
      window_padding_width = 12;
      background_opacity = "0.8";
    };
  };
}

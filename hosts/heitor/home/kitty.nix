{ pkgs, ... }:

let inherit (pkgs) ctx gctx;
in {
  programs.kitty = {
    enable = true;
    font = {
      package = gctx.fonts.package;
      name = gctx.fonts.term;
      size = 14;
    };

    settings = let palette = ctx.themes.rouen-catheral.colors;
    in {
      foreground = "#${palette.base05}";
      background = "#${palette.base00}";
      window_padding_width = 12;
      background_opacity = "0.8";
    };
  };
}

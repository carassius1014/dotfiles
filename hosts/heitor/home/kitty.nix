{ pkgs, ... }:

let
  inherit (pkgs) ctx gctx;
in
{
  programs.kitty = {
    enable = true;
    font = {
      package = gctx.fonts.package;
      name = gctx.fonts.term;
      size = 14;
    };

    settings =
      let
        palette = ctx.themes.rouen-catheral.palette;
      in
      {
        background = "#${palette.base00}";
        foreground = "#${palette.base05}";
        selection_background = "#${palette.base05}";
        selection_foreground = "#${palette.base00}";
        url_color = "#${palette.base04}";
        cursor = "#${palette.base05}";
        active_border_color = "#${palette.base03}";
        inactive_border_color = "#${palette.base01}";
        active_tab_background = "#${palette.base00}";
        active_tab_foreground = "#${palette.base05}";
        inactive_tab_background = "#${palette.base01}";
        inactive_tab_foreground = "#${palette.base04}";
        tab_bar_background = "#${palette.base01}";

        # normal
        color0 = "#${palette.base00}";
        color1 = "#${palette.base08}";
        color2 = "#${palette.base0B}";
        color3 = "#${palette.base0A}";
        color4 = "#${palette.base0D}";
        color5 = "#${palette.base0E}";
        color6 = "#${palette.base0C}";
        color7 = "#${palette.base05}";

        # bright
        color8 = "#${palette.base03}";
        color9 = "#${palette.base09}";
        color10 = "#${palette.base01}";
        color11 = "#${palette.base02}";
        color12 = "#${palette.base04}";
        color13 = "#${palette.base06}";
        color14 = "#${palette.base0F}";
        color15 = "#${palette.base07}";

        background_opacity = "0.9";

        window_padding_width = 12;
      };
  };
}

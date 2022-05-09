{ pkgs, ... }:

{
  services.yabai = {
    enable = true;
    package = pkgs.yabai;
    config = {
      # layout
      layout = "bsp";
      auto_balance = "on";
      split_ratio = "0.50";
      window_placement = "second_child";
      # Gaps
      window_gap = 12;
      top_padding = 12;
      bottom_padding = 12;
      left_padding = 12;
      right_padding = 12;
      # shadows and borders
      window_shadow = "on";
      window_border = "off";
      window_border_width = 3;
      window_opacity = "on";
      window_opacity_duration = "0.1";
      active_window_opacity = "1.0";
      normal_window_opacity = "0.8";
      # mouse
      mouse_modifier = "cmd";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      mouse_drop_action = "swap";
    };
    extraConfig = ''
      yabai -m rule --add app='Activty Monitor' manage=off
      yabai -m rule --add app='Emacs' manage=on
      yabai -m rule --add app='System Preferences' manage=off
    '';
  };
}

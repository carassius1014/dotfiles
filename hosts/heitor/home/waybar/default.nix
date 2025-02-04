{ pkgs, ... }:

let
  inherit (pkgs) ctx;
in
{
  programs.waybar = {
    enable = true;

    settings = {
      main = {
        layer = "top";
        position = "top";
        height = 32;
        spacing = 5;

        output = [ ctx.monitors.dell-U2720QM ];

        modules-left = [
          "sway/workspaces"
          "sway/mode"
          "wlr/taskbar"
        ];
        modules-center = [ "sway/window" ];
        modules-right = [
          "tray"
          "cpu"
          "temperature"
          "memory"
          "clock"
        ];

        "sway/mode" = {
          format = ''<span style="italic">{}</span>'';
        };

        "tray" = {
          spacing = 10;
        };

        "cpu" = {
          format = "CPU {usage}%";
          tooltip = false;
        };

        "temperature" = {
          critical-threshold = 80;
          format = "{temperatureC}°C {icon}";
          format-icons = [
            ""
            ""
            ""
          ];
        };

        "memory" = {
          format = "{}% ";
        };

        "clock" = {
          tooltip-format = ''
            <big>{:%Y %B}</big>
            <tt><small>{calendar}</small></tt>'';
          format = "{:%a %d %b  %H:%M}";
        };
      };
    };

    style = builtins.readFile ./style.css;
  };
}

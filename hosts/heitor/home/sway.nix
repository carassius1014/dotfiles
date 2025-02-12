{ pkgs, ... }:

let
  inherit (pkgs) ctx;
in
{
  wayland.windowManager.sway = {
    enable = true;

    # https://www.reddit.com/r/NixOS/comments/1c9n1qk/comment/l0n4u6y
    checkConfig = false;

    config =
      let
        # basic keys
        modifier = "Mod1";
        up = "k";
        down = "j";
        left = "h";
        right = "l";

        # workspaces
        ws1 = "1";
        ws2 = "2";
        ws3 = "3";
        ws4 = "4";
        ws5 = "5";
        ws6 = "6";
        ws7 = "7";
        ws8 = "8";
        ws9 = "9";

        status-bar = "${pkgs.waybar}/bin/waybar";
      in
      {
        inherit
          modifier
          up
          down
          left
          right
          ;

        focus.followMouse = "no";

        keybindings = {
          # start a terminal
          "${modifier}+Return" = "exec ${ctx.terminal}";

          # start launcher
          "Ctrl+space" = "exec ${pkgs.rofi-wayland}/bin/rofi -show run";

          # change focus
          "${modifier}+${up}" = "focus up";
          "${modifier}+${down}" = "focus down";
          "${modifier}+${left}" = "focus left";
          "${modifier}+${right}" = "focus right";

          # switch to workspace
          "${modifier}+1" = "workspace ${ws1}";
          "${modifier}+2" = "workspace ${ws2}";
          "${modifier}+3" = "workspace ${ws3}";
          "${modifier}+4" = "workspace ${ws4}";
          "${modifier}+5" = "workspace ${ws5}";
          "${modifier}+6" = "workspace ${ws6}";
          "${modifier}+7" = "workspace ${ws7}";
          "${modifier}+8" = "workspace ${ws8}";
          "${modifier}+9" = "workspace ${ws9}";

          # move focused container to workspace
          "${modifier}+Ctrl+1" = "move container to workspace ${ws1}";
          "${modifier}+Ctrl+2" = "move container to workspace ${ws2}";
          "${modifier}+Ctrl+3" = "move container to workspace ${ws3}";
          "${modifier}+Ctrl+4" = "move container to workspace ${ws4}";
          "${modifier}+Ctrl+5" = "move container to workspace ${ws5}";
          "${modifier}+Ctrl+6" = "move container to workspace ${ws6}";
          "${modifier}+Ctrl+7" = "move container to workspace ${ws7}";
          "${modifier}+Ctrl+8" = "move container to workspace ${ws8}";
          "${modifier}+Ctrl+9" = "move container to workspace ${ws9}";

          # reload the configuration file
          "${modifier}+Shift+c" = "reload";
          # restart sway inplace
          "${modifier}+Shift+r" = "restart";
          # exit sway
          "${modifier}+Shift+e" = "exec sway exit";

          # enter resize mode
          "${modifier}+r" = "mode resize";
        };

        modes = {
          resize = {
            "${up}" = "resize grow height 10 px";
            "${down}" = "resize shrink height 10 px";
            "${left}" = "resize shrink width 10 px";
            "${right}" = "resize grow width 10 px";

            Escape = "mode default";
          };
        };

        output = {
          "${ctx.monitors.dell-U2414H}" = {
            pos = "0 0";
            res = "1920x1080";
            transform = "270";
            bg = "~/.dotfiles/wallpapers/claude-monet-rouen-cathedral-1080x1920.jpeg fill";
          };

          "${ctx.monitors.dell-U2720QM}" = {
            pos = "1080 0";
            res = "3840x2160";
            scale = "2";
            bg = "~/.dotfiles/wallpapers/claude-monet-water-lilies-4500x2122.jpeg fill";
          };
        };

        workspaceOutputAssign = [
          {
            workspace = ws1;
            output = ctx.monitors.dell-U2414H;
          }
          {
            workspace = ws2;
            output = ctx.monitors.dell-U2414H;
          }
          {
            workspace = ws3;
            output = ctx.monitors.dell-U2720QM;
          }
          {
            workspace = ws4;
            output = ctx.monitors.dell-U2720QM;
          }
          {
            workspace = ws5;
            output = ctx.monitors.dell-U2720QM;
          }
          {
            workspace = ws6;
            output = ctx.monitors.dell-U2720QM;
          }
          {
            workspace = ws7;
            output = ctx.monitors.dell-U2720QM;
          }
          {
            workspace = ws8;
            output = ctx.monitors.dell-U2720QM;
          }
          {
            workspace = ws9;
            output = ctx.monitors.dell-U2720QM;
          }
        ];

        bars = [ { command = status-bar; } ];

        gaps = {
          inner = 6;
          outer = 6;
        };

        startup = [
          {
            command = "systemctl --user restart ${status-bar}";
            always = true;
          }
        ];
      };
  };
}

{ pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window.padding = {
        x = 16;
        y = 16;
      };

      font = {
        size = 14;
        normal = {
          family = "Sarasa Mono CL";
          style = "Regular";
        };
        bold = {
          family = "Sarasa Mono CL";
          style = "Bold";
        };
        italic = {
          family = "Sarasa Mono CL";
          style = "Italic";
        };
        bold_italic = {
          family = "Sarasa Mono CL";
          style = "Bold Italic";
        };
      };

      colors = {
        primary = {
          background = "0x000000";
          foreground = "0xfad6c4";
        };

        cursor = {
          text = "0x000000";
          cursor = "0xfad6c4";
        };

        normal = {
          black = "0x000000";
          red = "0xd54e53";
          green = "0xb9ca4a";
          yellow = "0xe6c547";
          blue = "0x5b81f3";
          magenta = "0xc397d8";
          cyan = "0x70c0ba";
          white = "0xffffff";
        };

        bright = {
          black = "0x666666";
          red = "0xff3334";
          green = "0x9ec400";
          yellow = "0xe7c547";
          blue = "0x7aa6da";
          magenta = "0xb77ee0";
          cyan = "0x54ced6";
          white = "0xffffff";
        };

        dim = {
          black = "0x333333";
          red = "0xf2777a";
          green = "0x99cc99";
          yellow = "0xffcc66";
          blue = "0x6699cc";
          magenta = "0xcc99cc";
          cyan = "0x66cccc";
          white = "0xdddddd";
        };
      };
    };
  };
}

{ pkgs, ... }:

{
  programs.foot = {
    enable = true;
    settings = {
      main = {
        term = "xterm-256color";
        font = "Sarasa Mono CL:size=12";
        dpi-aware = "yes";
      };
      mouse = { hide-when-typing = "yes"; };
    };
  };
}

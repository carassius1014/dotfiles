{ pkgs, ... }:

{
  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
      # open terminal
      # lalt - return : kitty

      # open emacs
      lalt - e : emacs

      # focus window
      lalt - h : yabai -m window --focus west
      lalt - j : yabai -m window --focus south
      lalt - k : yabai -m window --focus north
      lalt - l : yabai -m window --focus east

      # swap managed window
      shift + lalt - h : yabai -m window --swap west
      shift + lalt - l : yabai -m window --swap east
      shift + lalt - j : yabai -m window --swap south
      shift + lalt - k : yabai -m window --swap north

      # focus spaces
      lalt - x : yabai -m space --focus recent
      lalt - 1 : yabai -m space --focus 1
      lalt - 2 : yabai -m space --focus 2
      lalt - 3 : yabai -m space --focus 3
      lalt - 4 : yabai -m space --focus 4
      lalt - 5 : yabai -m space --focus 5
      lalt - 6 : yabai -m space --focus 6
      lalt - 7 : yabai -m space --focus 7
      lalt - 8 : yabai -m space --focus 8

      # focus on next/prev space
      lalt + ctrl - q : yabai -m space --focus prev
      lalt + ctrl - e : yabai -m space --focus next

      # send window to desktop
      shift + lalt - x : yabai -m window --space recent
      shift + lalt - 1 : yabai -m window --space 1
      shift + lalt - 2 : yabai -m window --space 2
      shift + lalt - 3 : yabai -m window --space 3
      shift + lalt - 4 : yabai -m window --space 4
      shift + lalt - 5 : yabai -m window --space 5
      shift + lalt - 6 : yabai -m window --space 6
      shift + lalt - 7 : yabai -m window --space 7
      shift + lalt - 8 : yabai -m window --space 8

       # float / unfloat window and center on screen
      lalt - t : yabai -m window --toggle float;\
                 yabai -m window --grid 4:4:1:1:2:2

      # toggle window zoom
      lalt - d : yabai -m window --toggle zoom-parent
    '';
  };
}

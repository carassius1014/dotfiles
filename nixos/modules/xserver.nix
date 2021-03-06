{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
    desktopManager = { xterm.enable = false; };
    displayManager = {
      defaultSession = "none+i3";
      lightdm = {
        enable = true;
        greeter.enable = true;
      };
    };
    windowManager = {
      i3.enable = true;
      i3.package = pkgs.i3-gaps;
      i3.extraPackages = with pkgs; [
        i3lock
        i3status
        i3-gaps
        (polybar.override { i3Support = true; })
        rofi
      ];
    };
  };
}

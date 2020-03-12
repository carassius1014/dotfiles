{ pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
    displayManager = {
      lightdm = {
        enable = true;
        greeter.enable = false;
        autoLogin.enable = true;
        autoLogin.user = "carassius1014";
      };
    };
    windowManager = {
      default = "i3";
      i3.enable = true;
      i3.package = pkgs.i3-gaps;
      i3.extraPackages = with pkgs; [
        i3lock
        i3status
        i3-gaps
        rofi
      ];
    };
  };
}

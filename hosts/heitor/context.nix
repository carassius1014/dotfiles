{ pkgs }:

{ # heitor contex
  monitors = {
    dell-U2414H = "DP-3";
    dell-U2720QM = "HDMI-A-1";
  };

  terminal = "${pkgs.kitty}/bin/kitty";
}

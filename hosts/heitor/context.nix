{ pkgs }:

{ # heitor contex
  monitors = {
    dell-U2414H = "HDMI-A-3";
    dell-U2720QM = "HDMI-A-2";
  };

  terminal = "${pkgs.kitty}/bin/kitty";
}

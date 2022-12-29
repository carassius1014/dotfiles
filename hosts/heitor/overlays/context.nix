self: super: {
  # heitor contex
  ctx = {
    monitors = {
      dell-U2414H = "DP-3";
      dell-U2720QM = "HDMI-A-1";
    };

    terminal = "${self.kitty}/bin/kitty";
  };
}

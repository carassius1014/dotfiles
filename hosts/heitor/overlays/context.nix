{ nix-colors }:

self: super: {
  # heitor contex
  ctx = {
    monitors = {
      eizo-EV2455 = "DP-3";
      dell-U2720QM = "HDMI-A-1";
    };

    terminal = "${self.kitty}/bin/kitty";

    themes =
      let
        nix-colors-lib = nix-colors.lib-contrib { pkgs = self; };
      in
      {
        rouen-catheral = nix-colors-lib.colorSchemeFromPicture {
          path = ../../../wallpapers/claude-monet-rouen-cathedral-1080x1920.jpeg;
          kind = "dark";
        };

        water-lilies = nix-colors-lib.colorSchemeFromPicture {
          path = ../../../wallpapers/claude-monet-water-lilies-4500x2122.jpeg;
          kind = "light";
        };
      };
  };
}

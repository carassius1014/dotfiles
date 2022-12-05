{ pkgs, ... }:

let
  swayConfig = pkgs.writeText "greetd-sway-config" ''
    exec "${pkgs.greetd.gtkgreet}/bin/gtkgreet -l -c sway; swaymsg exit"
  '';
in {
  programs.sway.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.sway}/bin/sway --config ${swayConfig}";
      };
    };
  };

  environment.etc."greetd/environments".text = ''
    sway
    fish
    bash
  '';
}

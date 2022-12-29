{ pkgs, lib, ... }:

let
  inherit (pkgs) gctx;

  swayRun = pkgs.writeShellScript "sway-run" ''
    systemd-run --user --scope --collect --quiet --unit=sway \
      systemd-cat --identifier=sway ${pkgs.sway}/bin/sway $@
  '';
in {
  services.greetd = {
    enable = true;
    restart = false;
    settings = {
      default_session = {
        command = "${
            lib.makeBinPath [ pkgs.greetd.tuigreet ]
          }/tuigreet --remember --time --cmd ${swayRun}";
        user = "greeter";
      };
      initial_session = {
        command = "${swayRun}";
        user = gctx.me.name;
      };
    };
  };
}

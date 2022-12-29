{ pkgs, ... }:

let inherit (pkgs) gctx;
in {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${gctx.me.name} = {
    isNormalUser = true;
    extraGroups = [ "audio" "docker" "wheel" "sound" ];
    shell = "/run/current-system/sw/bin/fish";
  };
}

{ pkgs, ... }:

let
  inherit (pkgs) gctx;
in
{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${gctx.me.name} = {
    isNormalUser = true;
    extraGroups = [
      "docker"
      "wheel"
    ];
    shell = "/run/current-system/sw/bin/fish";
  };
}

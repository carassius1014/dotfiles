{ pkgs, ... }:

let gctx = import ../../context.nix { inherit pkgs; };
in {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.${gctx.me.name} = {
    isNormalUser = true;
    extraGroups = [ "docker" "wheel" ];
    shell = "/run/current-system/sw/bin/fish";
  };
}

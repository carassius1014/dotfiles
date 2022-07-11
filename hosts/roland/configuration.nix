{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix

    ../common/configuration/nix.nix

    ./configuration/boot.nix
    ./configuration/console.nix
    ./configuration/docker.nix
    ./configuration/firewall.nix
    ./configuration/i18n.nix
    ./configuration/network.nix
    ./configuration/packages.nix
    ./configuration/ssh.nix
    ./configuration/system.nix
    ./configuration/terminal.nix
    ./configuration/users.nix
  ];
}

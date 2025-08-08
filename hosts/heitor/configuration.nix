{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix

    ../common/configuration/nix.nix

    ./configuration/audio.nix
    ./configuration/boot.nix
    ./configuration/console.nix
    ./configuration/docker.nix
    ./configuration/fonts.nix
    ./configuration/i18n.nix
    ./configuration/ld.nix
    ./configuration/network.nix
    ./configuration/packages.nix
    ./configuration/ssh.nix
    ./configuration/system.nix
    ./configuration/users.nix
    ./configuration/video.nix
    ./configuration/wayland.nix
  ];
}

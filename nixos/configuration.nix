{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix

      ./modules/audio.nix
      ./modules/boot.nix
      ./modules/console.nix
      ./modules/docker.nix
      ./modules/firewall.nix
      ./modules/fonts.nix
      ./modules/i18n.nix
      ./modules/network.nix
      ./modules/packages.nix
      ./modules/ssh.nix
      ./modules/system.nix
      ./modules/terminal.nix
      ./modules/users.nix
      ./modules/xserver.nix
    ];
}

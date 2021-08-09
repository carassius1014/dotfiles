{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    /etc/nixos/hardware-configuration.nix

    ./modules/audio.nix
    ./modules/boot.nix
    ./modules/console.nix
    ./modules/docker.nix
    ./modules/editor.nix
    ./modules/firewall.nix
    ./modules/fonts.nix
    ./modules/haskell.nix
    ./modules/i18n.nix
    ./modules/network.nix
    ./modules/packages.nix
    ./modules/ssh.nix
    ./modules/system.nix
    ./modules/terminal.nix
    ./modules/users.nix
    ./modules/video.nix
    ./modules/xserver.nix
  ];
}

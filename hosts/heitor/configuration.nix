{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/audio.nix
    ./modules/boot.nix
    ./modules/cachix.nix
    ./modules/console.nix
    ./modules/docker.nix
    ./modules/editor.nix
    ./modules/firewall.nix
    ./modules/fonts.nix
    ./modules/i18n.nix
    ./modules/network.nix
    ./modules/nixpkgs.nix
    ./modules/packages.nix
    ./modules/ssh.nix
    ./modules/system.nix
    ./modules/terminal.nix
    ./modules/users.nix
    ./modules/video.nix
    ./modules/xserver.nix
  ];
}

{ config, pkgs, ... }:

{
  imports = [
    ../common/configuration/nix.nix

    ./configuration/console.nix
    ./configuration/docker.nix
    ./configuration/ec2.nix
    ./configuration/i18n.nix
    ./configuration/network.nix
    ./configuration/packages.nix
    ./configuration/server.nix
    ./configuration/ssh.nix
    ./configuration/system.nix
    ./configuration/terminal.nix
    ./configuration/users.nix
  ];
}

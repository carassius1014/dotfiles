{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    binutils
    gnumake
    lsof
    neofetch
    vim
  ];
}

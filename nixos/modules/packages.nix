{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs
    git
    gnumake
    lsof
    rxvt_unicode
  ];
}

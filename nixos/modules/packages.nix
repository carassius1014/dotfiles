{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs
    git
    gnumake
    rxvt_unicode
  ];
}

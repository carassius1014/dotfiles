{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs
    git
    gnumake
    lsof
    lxqt.pavucontrol-qt
    rxvt_unicode
  ];
}

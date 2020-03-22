{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs
    git
    gnumake
    lsof
    lxqt.pavucontrol-qt
    nitrogen
    ruby
    rxvt_unicode
  ];
}

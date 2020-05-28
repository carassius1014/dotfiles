{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs
    git
    gnumake
    lsof
    lxqt.pavucontrol-qt
    nitrogen
    nixfmt
    ruby
    rxvt_unicode
  ];
}

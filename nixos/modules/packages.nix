{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    binutils
    emacs
    gcc
    git
    gnumake
    lsof
    lxqt.pavucontrol-qt
    nitrogen
    nixfmt
    ruby
    rxvt_unicode
    vim
    zlib
  ];
}

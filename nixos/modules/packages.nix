{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    alacritty
    binutils
    emacs
    gcc
    git
    gnumake
    lsof
    lxqt.pavucontrol-qt
    nitrogen
    ruby
    vim
    zlib
  ];
}

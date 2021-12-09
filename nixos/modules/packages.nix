{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    alacritty
    binutils
    gcc
    git
    gnumake
    libgccjit
    lsof
    lxqt.pavucontrol-qt
    neofetch
    nitrogen
    ruby
    vim
    zlib
  ];
}

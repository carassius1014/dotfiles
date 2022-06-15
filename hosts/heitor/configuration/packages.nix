{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    alacritty
    binutils
    git
    gnumake
    libgccjit
    lsof
    lxqt.pavucontrol-qt
    neofetch
    nitrogen
    vim
  ];
}

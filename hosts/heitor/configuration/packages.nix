{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    alacritty
    binutils
    dmidecode
    git
    gnumake
    libgccjit
    lsof
    lxqt.pavucontrol-qt
    neofetch
    vim
  ];
}

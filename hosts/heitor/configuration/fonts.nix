{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    emacs-all-the-icons-fonts
    fira-code
    noto-fonts
    sarasa-gothic
  ];
}


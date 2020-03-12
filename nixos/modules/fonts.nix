{ pkgs, ... }:

{
  fonts.fonts = with pkgs; [
    emacs-all-the-icons-fonts
    noto-fonts
    sarasa-gothic
  ];
}
  
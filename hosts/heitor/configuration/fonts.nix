{ pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      emacs-all-the-icons-fonts
      fira-code
      liberation_ttf
      noto-fonts
      sarasa-gothic
      wqy_zenhei
    ];

    fontDir.enable = true;
    fontconfig.enable = true;
  };
}


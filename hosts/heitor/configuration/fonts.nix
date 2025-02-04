{ pkgs, ... }:

{
  fonts = {
    packages = with pkgs; [
      emacs-all-the-icons-fonts
      fira-code
      font-awesome
      liberation_ttf
      noto-fonts
      sarasa-gothic
      wqy_zenhei
    ];

    fontDir.enable = true;
    fontconfig.enable = true;
  };
}

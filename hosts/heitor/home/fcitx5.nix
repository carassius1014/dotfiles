{ pkgs, ... }:

{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chinese-addons
      fcitx5-configtool
      fcitx5-gtk
      fcitx5-mozc
    ];
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_SESSION_TYPE = "wayland";
  };
}

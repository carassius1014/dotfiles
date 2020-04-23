{ pkgs, ... }:

{
  # Select internationalisation properties.

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx";
      fcitx.engines = with pkgs.fcitx-engines; [
        libpinyin
	      mozc
      ];
    };
  };

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";
}

{ pkgs, ... }:

{
  # Select internationalisation properties.

  i18n = {
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";
}

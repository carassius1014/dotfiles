{ pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition-bin;

    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      https-everywhere
      onepassword-password-manager
      ublock-origin
    ];

    profiles = let commonSettings = { "ui.key.menuAccessKey" = 0; };
    in {
      default = {
        id = 0;
        name = "dev-edition-default";
        settings = commonSettings;
      };

      work = {
        id = 1;
        name = "work";
        settings = commonSettings;
      };

      home = {
        id = 2;
        name = "home";
        settings = commonSettings;
      };

      private = {
        id = 3;
        name = "private";
        settings = commonSettings;
      };
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_SESSION_TYPE = "wayland";
  };
}

{ pkgs, ... }:

{
  programs.firefox = let
    extensions = with pkgs.nur.repos.rycee.firefox-addons; [
      onepassword-password-manager
      ublock-origin
    ];
  in {
    enable = true;
    package = pkgs.firefox-devedition-bin;

    profiles = let commonSettings = { "ui.key.menuAccessKey" = 0; };
    in {
      default = {
        id = 0;
        name = "dev-edition-default";
        settings = commonSettings;
        inherit extensions;
      };

      work = {
        id = 1;
        name = "work";
        settings = commonSettings;
        inherit extensions;
      };

      home = {
        id = 2;
        name = "home";
        settings = commonSettings;
        inherit extensions;
      };

      private = {
        id = 3;
        name = "private";
        settings = commonSettings;
        inherit extensions;
      };
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_SESSION_TYPE = "wayland";
  };
}

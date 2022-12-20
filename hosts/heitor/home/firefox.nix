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

    profiles = {
      default = {
        id = 0;
        name = "dev-edition-default";
      };

      work = {
        id = 1;
        name = "work";
      };

      home = {
        id = 2;
        name = "home";
      };

      private = {
        id = 3;
        name = "private";
      };
    };
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    XDG_SESSION_TYPE = "wayland";
  };
}

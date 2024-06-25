{ pkgs, ... }:

let
  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
    onepassword-password-manager
    ublock-origin
  ];
in {
  programs.firefox = {
    enable = true;
    profiles = {
      default = {
        id = 0;
        name = "default";
        inherit extensions;
      };

      work = {
        id = 1;
        name = "work";
        inherit extensions;
      };

      home = {
        id = 2;
        name = "home";
        inherit extensions;
      };

      private = {
        id = 3;
        name = "private";
        inherit extensions;
      };
    };
  };
}

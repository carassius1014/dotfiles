{ pkgs, ... }:

let
  packages = with pkgs.nur.repos.rycee.firefox-addons; [
    onepassword-password-manager
    ublock-origin
  ];
in
{
  programs.firefox = {
    enable = true;

    policies = {
      DefaultDownloadDirectory = "\${home}/Downloads";
    };

    profiles = {
      default = {
        id = 0;
        name = "default";
        extensions = { inherit packages; };
      };

      work = {
        id = 1;
        name = "work";
        extensions = { inherit packages; };
      };

      home = {
        id = 2;
        name = "home";
        extensions = { inherit packages; };
      };

      private = {
        id = 3;
        name = "private";
        extensions = { inherit packages; };
      };
    };
  };
}

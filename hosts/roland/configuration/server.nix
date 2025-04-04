{ pkgs, ... }:

let
  inherit (pkgs) gctx;
in
{
  security.acme = {
    acceptTerms = true;
    defaults.email = gctx.me.email;
  };

  services.nginx = {
    enable = true;
    virtualHosts = {
      "carassius1014.io" = {
        addSSL = true;
        enableACME = true;
        root = "/home/${gctx.me.name}/www";
      };
    };
  };
}

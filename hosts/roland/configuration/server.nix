{
  services.nginx.enable = true;
  services.nginx.virtualHosts."carassius1014.io" = {
    addSSL = true;
    enableACME = true;
    root = "/home/carassius1014/www";
  };
}

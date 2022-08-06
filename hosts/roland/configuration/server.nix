{
  security.acme = {
    acceptTerms = true;
    defaults.email = "carassius1014@gmail.com";
  };

  services.nginx = {
    enable = true;
    virtualHosts = {
      "carassius1014.io" = {
        addSSL = true;
        enableACME = true;
        root = "/home/carassius1014/www";
      };
    };
  };
}

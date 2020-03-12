{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    myPackages = pkgs.buildEnv {
      name = "my-packages";
      paths = [
        direnv
        docker-compose
        google-chrome
        stack
      ];
    };
  };
}

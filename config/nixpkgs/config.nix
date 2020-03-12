{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    carassius1014Packages = pkgs.buildEnv {
      name = "carassius1014-packages";
      paths = [
        google-chrome
        stack
      ];
    };
  };
}

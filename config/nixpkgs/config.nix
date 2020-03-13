{
  allowUnfree = true;
  packageOverrides = pkgs: with pkgs; {
    macosPackages = pkgs.buildEnv {
      name = "macos-packages";
      paths = [
      ];
    };
    nixosPackages = pkgs.buildEnv {
      name = "nixos-packages";
      paths = [
        direnv
        docker-compose
        ghcid
        google-chrome
        stack
      ];
    };
  };
}

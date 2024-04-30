{ pkgs, ... }:

{
  programs.chromium = {
    enable = true;
    package = pkgs.symlinkJoin {
      name = "chrome";
      paths = [ pkgs.google-chrome ];
      buildInputs = [ pkgs.makeWrapper ];
      postBuild = ''
        wrapProgram $out/bin/google-chrome-stable \
          --add-flags "\
            --enable-features=UseOzonePlatform \
            --ozone-platform=wayland \
            --gtk-version=4 \
          "
      '';
    };
  };
}

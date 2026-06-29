{ pkgs, ... }:

{
  home.packages =
    let
      commonPackages = import ../../common/home/packages.nix { inherit pkgs; };
    in
    with pkgs;
    [
      adwaita-icon-theme
      libnotify
      simulide
      symbola
      xdg-utils
    ]
    ++ commonPackages;
}

{ pkgs, pkgs-unstable, ... }:

{
  home.packages =
    let
      commonPackages = import ../../common/home/packages.nix { inherit pkgs pkgs-unstable; };
    in
    with pkgs;
    [
      adwaita-icon-theme
      libnotify
      steam
      symbola
      xdg-utils
    ]
    ++ commonPackages;
}

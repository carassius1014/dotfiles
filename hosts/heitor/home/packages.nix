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
      symbola
      xdg-utils
    ]
    ++ commonPackages;
}

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
      steam
      symbola
      xdg-utils
    ]
    ++ commonPackages;
}

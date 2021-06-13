{ config, lib, pkgs, ... }:

{
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url =
        "https://github.com/nix-community/emacs-overlay/archive/master.tar.gz";
    }))
  ];

  services.emacs.package = with pkgs;
    ((emacsPackagesNgGen emacsGcc).emacsWithPackages (epkgs: [ epkgs.vterm ]));
  services.emacs.enable = true;
}

{ pkgs, ghcVersion }:

let
  compiler = pkgs.haskell.packages.${ghcVersion};
in compiler.developPackage {
  root = ./.;
}

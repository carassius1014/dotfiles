{ pkgs, ... }:

with pkgs;
buildEnv {
  name = "haskell-pkgs";
  paths = with haskellPackages; [ hoogle ormolu threadscope ];
}

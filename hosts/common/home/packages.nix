{ pkgs }:

{
  haskellPackages =
    with pkgs;
    let
      ghcVersion = "ghc96";
    in
    [
      ghcid
      haskellPackages.fourmolu
      haskellPackages.hoogle
      haskell.compiler."${ghcVersion}"
      hpack
      zlib
    ];
}

{ pkgs }:

{
  haskellPackages = with pkgs;
    let ghcVersion = "ghc947";
    in [
      ghcid
      haskellPackages.fourmolu
      haskellPackages.hoogle
      haskell.compiler."${ghcVersion}"
      hpack
      zlib
    ];
}

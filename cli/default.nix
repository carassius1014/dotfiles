{ pkgs, ghcVersion }:

let compiler = pkgs.haskell.packages.${ghcVersion};
in compiler.developPackage {
  root = ./.;
  overrides = self: super: {
    ListLike = pkgs.haskell.lib.dontCheck super.ListLike;
  };
}

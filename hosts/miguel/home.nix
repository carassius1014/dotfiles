{ pkgs, codexHmModule, ... }:

{
  imports = [
    codexHmModule
    ../common/home/codex.nix
    ../common/home/emacs.nix
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/fish.nix
    ../common/home/programs/gh.nix
    ../common/home/programs/git.nix
  ];

  home = let ghcVersion = "ghc927";
  in {
    packages = with pkgs; [
      cachix
      haskell.compiler.${ghcVersion}
      haskell.packages.${ghcVersion}.fourmolu
      haskell.packages.${ghcVersion}.ghcid
      haskell.packages.${ghcVersion}.hoogle
      nixfmt
      nodejs
      python310Packages.editorconfig
      ripgrep
      tree
      yarn
      zstd
    ];

    stateVersion = "22.05";
  };
}

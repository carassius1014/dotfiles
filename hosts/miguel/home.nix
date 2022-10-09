{ pkgs, codexHmModule, ... }:

{
  imports = [
    codexHmModule
    ./home/codex.nix
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/fish.nix
    ../common/home/programs/gh.nix
    ../common/home/programs/git.nix
  ];

  home = {
    packages = with pkgs; [
      cachix
      jq
      nixfmt
      python310Packages.editorconfig
      ripgrep
      zstd
    ];

    stateVersion = "22.05";
  };
}

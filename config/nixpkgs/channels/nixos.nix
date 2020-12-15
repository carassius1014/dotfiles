let
  nixpkgs = builtins.fetchGit {
    name = "nixos-unstable-Dec-2020";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "e9158eca70ae59e73fae23be5d13d3fa0cfc78b4";
  };
in import nixpkgs { }

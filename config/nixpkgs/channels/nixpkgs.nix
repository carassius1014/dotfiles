let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Feb-2021";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "410bbd828cdc6156aecd5bc91772ad3a6b1099c7";
  };
in import nixpkgs { }

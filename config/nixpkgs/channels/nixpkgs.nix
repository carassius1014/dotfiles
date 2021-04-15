let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Apr-2021";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "54c1e44240d8a527a8f4892608c4bce5440c3ecb";
  };
in import nixpkgs { }

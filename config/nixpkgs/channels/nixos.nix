let
  nixpkgs = builtins.fetchGit {
    name = "nixos-unstable-Jan-2021";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "733e537a8ad76fd355b6f501127f7d0eb8861775";
  };
in import nixpkgs { }

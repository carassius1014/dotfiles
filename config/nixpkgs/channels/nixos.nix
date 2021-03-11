let
  nixpkgs = builtins.fetchGit {
    name = "nixos-unstable-Mar-2021";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "29b0d4d0b600f8f5dd0b86e3362a33d4181938f9";
  };
in import nixpkgs { }

let
  nixpkgs = builtins.fetchGit {
    name = "nixos-unstable-Apr-2021";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "04a2b269d8921505a2969fc9ec25c1f517f2b307";
  };
in import nixpkgs { }

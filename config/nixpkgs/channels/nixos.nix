let
  nixpkgs = builtins.fetchGit {
    name = "nixos-unstable-Feb-2021";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "65211f5afcc3637c55423b327157a5eae05dff67";
  };
in import nixpkgs { }

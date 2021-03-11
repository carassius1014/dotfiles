let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Mar-2021";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "f5f6dc053b1a0eca03c853dad710f3de070df24e";
  };
in import nixpkgs { }

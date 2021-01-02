let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Jan-2021";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "2080afd039999a58d60596d04cefb32ef5fcc2a2";
  };
in import nixpkgs { }

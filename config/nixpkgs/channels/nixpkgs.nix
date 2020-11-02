let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Nov-2020";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "2c931312ce6c7baf91ec98e164bef0241fc20aa6";
  };
in import nixpkgs { }

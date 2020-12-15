let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Dec-2020";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "8006772a054ce57ca18c5955dcd6ec9a62577473";
  };
in import nixpkgs { }

let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Aug-2020";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "5ad1cdafe15d4ea79ae6abcddc360dd2de35b44e";
  };
in import nixpkgs { }

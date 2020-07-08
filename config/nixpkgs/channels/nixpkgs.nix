let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Jul-2020";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "4855aa62fa13052fb1a3daea68971503ab07a744";
  };
in import nixpkgs { }

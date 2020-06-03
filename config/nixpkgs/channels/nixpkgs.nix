let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Jun-2020";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "00df2371122aeb96b4ca80451b1ac7b9b7b8d847";
  };
in import nixpkgs { }

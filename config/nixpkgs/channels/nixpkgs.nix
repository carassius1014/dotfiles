let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Oct-2020";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "502845c3e31ef3de0e424f3fcb09217df2ce6df6";
  };
in import nixpkgs { }

let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-19.09-darwin";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixpkgs-19.09-darwin";
    rev = "f6c1d3b113ce9e7c908991df2e8eed02f03df1bc";
  };
in import nixpkgs { }

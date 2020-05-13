let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-20.03-darwin";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixpkgs-20.03-darwin";
    rev = "fb5517f5c9e3fa12f038e6f1c2b677b0b040dd47";
  };
in import nixpkgs { }

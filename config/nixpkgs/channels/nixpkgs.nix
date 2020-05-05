let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-May-2020";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "10100a97c8964e82b30f180fda41ade8e6f69e41";
  };
in import nixpkgs { }

let
  nixpkgs = builtins.fetchGit {
    name = "nixos-unstable-Oct-2020";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixos-unstable";
    rev = "84d74ae9c9cbed73274b8e4e00be14688ffc93fe";
  };
in import nixpkgs { }

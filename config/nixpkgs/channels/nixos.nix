let
  nixpkgs = builtins.fetchGit {
    name = "nixos-unstable";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixos-unstable";
    rev = "61525137fd1002f6f2a5eb0ea27d480713362cd5";
  };
in import nixpkgs { }

let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-Sep-2020";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "f9567594d5af2926a9d5b96ae3bada707280bec6";
  };
in import nixpkgs { }

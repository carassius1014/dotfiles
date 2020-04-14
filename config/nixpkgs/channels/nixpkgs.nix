let
  nixpkgs = builtins.fetchGit {
    name = "nixpkgs-unstable-2020-04-15";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixpkgs-unstable";
    rev = "8686922e68dfce2786722acad9593ad392297188";
  };
in import nixpkgs { }

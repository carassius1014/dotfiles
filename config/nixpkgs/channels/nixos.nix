let
  nixpkgs = builtins.fetchGit {
    name = "nixos-unstable-Nov-2020";
    url = "https://github.com/NixOS/nixpkgs/";
    ref = "refs/heads/nixos-unstable";
    rev = "1dc37370c489b610f8b91d7fdd40633163ffbafd";
  };
in import nixpkgs { }

let
  nixpkgs = builtins.fetchGit {
    name = "nixos-20.03";
    url = "https://github.com/nixos/nixpkgs-channels/";
    ref = "refs/heads/nixos-20.03";
    rev = "95b9c99f6d091273572ff1ec62b97b6ad3f68bdf";
  };
in import nixpkgs { }

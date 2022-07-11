{ pkgs, lib, ... }:

{
  nix = {
    binaryCaches = [
      "https://cache.nixos.org"
      "https://herp-slum.cachix.org"
      "https://hydra.iohk.io"
      "https://nix-community.cachix.org"
    ];

    binaryCachePublicKeys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "herp-slum.cachix.org-1:6SC4HZSxqnmi6Jyxg+Omz+8o2uz8r4sgrz+cB1hn42I="
      "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = aarch64-darwin
      netrc-file = /Users/carassius1014/.netrc
    '' + lib.optionalString (pkgs.system == "x86-linux") ''
      netrc-file = /home/carassius1014/.netrc
    '';

    trustedUsers = [ "@admin" ];
  };

  nixpkgs.config.allowUnfree = true;
}

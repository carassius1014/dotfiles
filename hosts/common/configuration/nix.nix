{ pkgs, lib, ... }:

let gctx = import ../../context.nix { inherit pkgs; };
in {
  nix = {
    settings = {
      substituters = [
        "https://cache.iog.io"
        "https://cache.nixos.org"
        "https://herp-slum.cachix.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "herp-slum.cachix.org-1:6SC4HZSxqnmi6Jyxg+Omz+8o2uz8r4sgrz+cB1hn42I="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];

      trusted-users = [ "@admin" ];
    };

    extraOptions = ''
      auto-optimise-store = true
      experimental-features = nix-command flakes
    '' + lib.optionalString (pkgs.system == "aarch64-darwin") ''
      extra-platforms = aarch64-darwin
      netrc-file = /Users/${gctx.me.name}/.netrc
    '' + lib.optionalString (pkgs.system == "x86_64-linux") ''
      netrc-file = /home/${gctx.me.name}/.netrc
    '';
  };

  nixpkgs.config.allowUnfree = true;
}

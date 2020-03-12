function nix-load-packages
  nix-env -f "<nixpkgs>" -iA myPackages
end

function nix-reload-packages
  nix-env -f "<nixpkgs>" -iA homePackages
end

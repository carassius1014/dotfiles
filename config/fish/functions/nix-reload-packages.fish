function nix-reload-packages
  nix-env -f "<nixpkgs>" -iA commonPackages
  switch (uname)
    case Darwin
      nix-env -f "<nixpkgs>" -iA macosPackages
    case Linux
      nix-env -f "<nixpkgs>" -iA nixosPackages
  end
end

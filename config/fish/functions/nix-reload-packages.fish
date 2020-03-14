function nix-reload-packages
  switch (uname)
    case Darwin
      nix-env -f "<nixpkgs>" -iA macosPackages
    case Linux
      nix-env -f "<nixpkgs>" -iA nixosPackages
  end
end

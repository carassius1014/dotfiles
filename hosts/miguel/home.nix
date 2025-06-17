{
  pkgs,
  codexHmModule,
  ...
}:

{
  imports = [
    codexHmModule
    ../common/home/codex.nix
    ../common/home/emacs.nix
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/gh.nix
    ../common/home/programs/git
    ../common/home/programs/git/company.nix
    ../common/home/programs/zsh.nix
  ];

  home =
    let
      commonPackages = import ../common/home/packages.nix { inherit pkgs; };
    in
    {
      packages = commonPackages;

      stateVersion = "22.05";
    };
}

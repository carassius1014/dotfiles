{ pkgs }:

let gctx = import ../context.nix { inherit pkgs; };
in {
  imports = [
    ../common/home/programs
    ../common/home/programs/direnv.nix
    ../common/home/programs/fish.nix
    ../common/home/programs/gh.nix
    ../common/home/programs/git.nix
  ];

  home = {
    username = gctx.me.name;
    homeDirectory = "/home/${gctx.me.name}";

    packages = with pkgs; [ httpie jq python310 ];

    stateVersion = "22.05";
  };
}

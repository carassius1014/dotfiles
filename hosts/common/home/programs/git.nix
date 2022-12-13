{ pkgs, ... }:

let gctx = import ../../../context.nix { inherit pkgs; };
in {
  programs.git = {
    enable = true;
    userName = gctx.me.realName;
    userEmail = gctx.me.email;
    ignores = [ ".direnv" ];
    extraConfig = { init = { defaultBranch = "master"; }; };
  };
}

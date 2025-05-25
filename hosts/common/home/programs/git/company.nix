{ pkgs, ... }:

let
  inherit (pkgs) gctx;
  contents = {
    user.name = gctx.me.realName;
    user.email = gctx.me.companyEmail;
    commit.gpgsign = true;
  };
in
{
  programs.git = {
    includes = [
      {
        condition = "gitdir:~/work/github.com/herp-inc-hq/";
        inherit contents;
      }
    ];
  };
}

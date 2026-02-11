{ pkgs, ... }:

let
  inherit (pkgs) gctx;

  ghCredentialHelper = pkgs.writeShellScript "gh-credential-helper" ''
    if [ "$1" != "get" ]; then
      exit 0
    fi

    path=""
    while IFS= read -r line; do
      case "$line" in
        "") break ;;
        path=*) path="''${line#path=}" ;;
      esac
    done

    account="${gctx.me.name}"
    case "$path" in
      herp-inc-hq/*) account="carassius_herpinc" ;;
    esac

    token=$(${pkgs.gh}/bin/gh auth token --user "$account")
    printf 'username=%s\npassword=%s\n' "$account" "$token"
  '';

in
{
  programs.git = {
    enable = true;
    userName = gctx.me.realName;
    userEmail = gctx.me.email;
    ignores = [ ".direnv" ];
    extraConfig = {
      init = {
        defaultBranch = "master";
      };
      credential."https://github.com" = {
        helper = "!${ghCredentialHelper}";
        useHttpPath = true;
      };
      credential."https://gist.github.com" = {
        helper = "!${ghCredentialHelper}";
      };
    };
  };
}

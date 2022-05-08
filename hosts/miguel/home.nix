{ pkgs, ... }:

{
  home.packages = with pkgs; [
    coreutils
    gh
    jq
    python310Packages.editorconfig
    ripgrep
  ];

  programs = {
    emacs.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    git = {
      enable = true;
      userName = "Jiyu Zhou";
      userEmail = "carassius1014@gmail.com";
      ignores = [ ".direnv" ];
      extraConfig = { init = { defaultBranch = "master"; }; };
    };

    fish = {
      enable = true;

      plugins = [{
        name = "foreign-env";
        src = pkgs.fetchFromGitHub {
          owner = "oh-my-fish";
          repo = "plugin-foreign-env";
          rev = "b3dd471bcc885b597c3922e4de836e06415e52dd";
          sha256 = "13wdsvpazivlxk921ccqbk7gl6ya2md8f45rckbn8rn119ckf7fy";
        };
      }];

      shellInit = ''
         # nix
         if test -e /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
           fenv source /nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh
         end

         # node
        	set PATH ./node_modules/.bin $PATH

         # doom emacs
        	set PATH $HOME/.emacs.d/bin $PATH
      '';
    };

    home-manager.enable = true;
  };
}

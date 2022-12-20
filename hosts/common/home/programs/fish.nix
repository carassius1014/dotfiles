{ pkgs, ... }:

{
  programs.fish = {
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

      # .local/bin
      set PATH $HOME/.local/bin $PATH
    '';

    functions = {
      e = {
        description = "Start emacs without window";
        body = "emacs -nw $argv";
      };

      browser_default = {
        description = "Start Browser using the default profile";
        body = "firefox-devedition -P dev-edition-default";
      };

      browser_work = {
        description = "Start Browser using the work profile";
        body = "firefox-devedition -P work";
      };

      browser_home = {
        description = "Start Browser using the home profile";
        body = "firefox-devedition -P home";
      };

      browser_private = {
        description = "Start Browser using the private profile";
        body = "firefox-devedition -P private";
      };

      fish_prompt = {
        description = "Write out the prompt";
        body = ''
          set -l color_cwd
          set -l suffix
          switch "$USER"
            case root toor
              if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
              else
                set color_cwd $fish_color_cwd
              end
              set suffix 'Λ'
            case '*'
              set color_cwd $fish_color_cwd
              set suffix 'λ'
          end

          set -l nix_shell_info (
          if test "$IN_NIX_SHELL" = 'impure'
              echo -n "<nix-shell> "
          end )

          echo -s "$USER" @ (prompt_hostname) ' ' "$nix_shell_info" (set_color $color_cwd) (prompt_pwd)
          echo -n -s (set_color normal) "$suffix "
        '';
      };

      run = {
        description = "Run scripts under $HOME/.dotfiles/scripts";
        body = ''
          set -l cmd_name $argv[1]
          set -l cmd_args $argv[2..-1]
          set -l cmd "$HOME/.dotfiles/scripts/$cmd_name"
          $cmd $cmd_args
        '';
      };
    };
  };
}

{ lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent =
      let
        paths = [
          "$HOME/.bun/bin"
          "$HOME/.dotfiles/emacs.d/bin"
        ];
      in
      ''
        autoload -Uz vcs_info
        precmd() { vcs_info }

        zstyle ':vcs_info:git:*' formats '%b '

        setopt PROMPT_SUBST
        PROMPT=$'%n@%m %F{green}%~%f %F{blue}''${vcs_info_msg_0_}%f\nλ '

        export PATH=$PATH:${lib.concatStringsSep ":" paths}

        export ANTHROPIC_MODEL='us.anthropic.claude-3-7-sonnet-20250219-v1:0'
        export ANTHROPIC_SMALL_FAST_MODEL='us.anthropic.claude-3-5-haiku-20241022-v1:0'
        export CLAUDE_CODE_USE_BEDROCK=1
      '';
  };
}

{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    initContent = ''
      autoload -Uz vcs_info
      precmd() { vcs_info }

      zstyle ':vcs_info:git:*' formats '%b '

      setopt PROMPT_SUBST
      PROMPT=$'%n@%m %F{green}%~%f %F{blue}''${vcs_info_msg_0_}%f\nλ '

      export PATH=$PATH:$HOME/.dotfiles/emacs.d/bin
    '';
  };
}

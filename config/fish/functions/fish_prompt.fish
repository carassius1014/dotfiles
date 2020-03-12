function fish_prompt --description 'Write out the prompt'
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
end

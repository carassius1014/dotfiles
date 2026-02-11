;;; ~/.dotfiles/doom.d/config/env.el -*- lexical-binding: t; -*-

(when (eq system-type 'darwin)
  ;; Ensure Nix-managed paths are in exec-path so Emacs can find binaries like
  ;; ripgrep, gls, etc., even when launched as a GUI app on macOS.
  (dolist (dir '("/etc/profiles/per-user/carassius1014/bin"
                "/run/current-system/sw/bin"
                "/nix/var/nix/profiles/default/bin"))
    (add-to-list 'exec-path dir)
    (unless (string-match-p dir (getenv "PATH"))
      (setenv "PATH" (concat dir ":" (getenv "PATH")))))

  ;; Use GNU ls (gls) from coreutils for dired, since macOS BSD ls does not
  ;; support --dired.
  (setq insert-directory-program "gls"
        dired-use-ls-dired t))

;;; -*- lexical-binding: t; -*-

(when (memq window-system '(mac ns x))
  (progn
    (use-package exec-path-from-shell
      :ensure t
      :init
      (exec-path-from-shell-initialize)
      )

    (setq ns-command-modifier 'meta)
    (setq dired-use-ls-dired nil)))

(provide 'prelude-macos)


;;; emacs/config.el -*- lexical-binding: t; -*-

(use-package! dired+
  :init
  (setq diredp-hide-details-initially-flag nil)
  :config
  (diredp-toggle-find-file-reuse-dir 1))

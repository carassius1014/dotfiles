;;; -*- lexical-binding: t; -*-

(use-package dired+
  :load-path "repositories/dired-plus"
  :init
  (setq diredp-hide-details-initially-flag nil)
  :config
  (diredp-toggle-find-file-reuse-dir 1))

(provide 'prelude-dired)

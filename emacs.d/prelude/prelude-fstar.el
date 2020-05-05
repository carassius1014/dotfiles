;;; -*- lexical-binding: t; -*-

(use-package fstar-mode
  :ensure
  :config
  (setq-default fstar-executable "/usr/bin/env fstar.exe")
  (setq-default fstar-smt-executable "/usr/bin/env z3"))

(provide 'prelude-fstar)

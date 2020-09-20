;;; lang/haskell/config.el -*- lexical-binding: t; -*-

(use-package! rust-mode
  :mode
  (("\\.lalrpop\\'" . rust-mode))
  :config
  (setq! rust-format-on-save 't)
  (setq! rust-format-show-buffer nil)
  (setq! rust-format-goto-problem nil))

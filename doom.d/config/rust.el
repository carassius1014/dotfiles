;;; ~/.dotfiles/doom.d/config/rust.el -*- lexical-binding: t; -*-

;; syntax-highlight だけ。LSP (rust-analyzer) は使わない。
(use-package! rust-mode
  :mode "\\.rs\\'"
  :config
  (setq rust-format-on-save nil))

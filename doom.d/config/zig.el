;;; ~/.dotfiles/doom.d/config/zig.el -*- lexical-binding: t; -*-

;; syntax-highlight だけ。LSP (zls) は使わない。
(use-package! zig-mode
  :mode "\\.\\(zig\\|zon\\)\\'"
  :config
  (setq zig-format-on-save nil))

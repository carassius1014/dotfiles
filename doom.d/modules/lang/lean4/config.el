;;; lang/lean4/config.el -*- lexical-binding: t; -*-

(use-package! lean4-mode
  :mode "\\.lean\\'"
  :config
  ;; lean4-mode-hook defaults to (lsp), so the mode auto-starts the Lean
  ;; language server. Drop it since we don't want LSP for Lean.
  (remove-hook 'lean4-mode-hook #'lsp))

;;; -*- lexical-binding: t; -*-

(use-package haskell-mode
  :ensure t
  :mode (("\\.hs\\'" . haskell-mode))
  :config
  (setq haskell-font-lock-symbols t)
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template))

(provide 'prelude-haskell)

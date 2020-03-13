;;; -*- lexical-binding: t; -*-

(use-package haskell-mode
  :ensure t
  :mode (("\\.hs\\'" . haskell-mode))
  :config
  (setq haskell-font-lock-symbols t)
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template))

(use-package dante
  :ensure t
  :after haskell-mode
  :commands 'dante-mode
  :init
  (add-hook 'haskell-mode-hook 'flycheck-mode)
  (add-hook 'haskell-mode-hook 'dante-mode)
  :config
  (setq dante-repl-command-line '("stack" "repl"))
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (auto-save-visited-mode 1)
  (setq auto-save-visited-interval 1))

(provide 'prelude-haskell)

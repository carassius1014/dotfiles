;;; -*- lexical-binding: t; -*-

(use-package haskell-mode
  :ensure t
  :mode (("\\.hs\\'" . haskell-mode))
  :config
  (setq haskell-font-lock-symbols t)
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  (setq haskell-stylish-on-save nil)
  (setq haskell-mode-stylish-haskell-path "ormolu"))

(defun turn-on-haskell-format-on-save ()
  (interactive)
  (setq haskell-stylish-on-save t))

(defun turn-off-haskell-format-on-save ()
  (interactive)
  (setq haskell-stylish-on-save nil))

(add-to-list 'auto-mode-alist '("\\.x\\'" . fundamental-mode))
(add-to-list 'auto-mode-alist '("\\.y\\'" . fundamental-mode))

(provide 'prelude-haskell)

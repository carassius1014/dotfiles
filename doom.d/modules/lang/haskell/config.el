;;; lang/haskell/config.el -*- lexical-binding: t; -*-

(use-package! haskell-mode
  :mode
  (("\\.hs\\'" . haskell-mode)
   ("\\.x\\'" . fundamental-mode)
   ("\\.y\\'" . fundamental-mode))
  :config
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  (setq haskell-stylish-on-save t)
  (setq haskell-mode-stylish-haskell-path "ormolu"))

(defun turn-on-haskell-format-on-save ()
  (interactive)
  (setq haskell-stylish-on-save t))

(defun turn-off-haskell-format-on-save ()
  (interactive)
  (setq haskell-stylish-on-save nil))

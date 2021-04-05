;;; lang/haskell/config.el -*- lexical-binding: t; -*-

(use-package! haskell-mode
  :mode
  (("\\.hs\\'" . haskell-mode)
   ("\\.x\\'" . fundamental-mode)
   ("\\.y\\'" . fundamental-mode))
  :config
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  (add-hook 'buffer-list-update-hook 'setup-haskell-stylish-on-save)
  (setq haskell-mode-stylish-haskell-path "ormolu"))

(defun setup-haskell-stylish-on-save ()
  (if (getenv "NO_HASKELL_STYLISH_ON_SAVE")
      (setq haskell-stylish-on-save nil)
    (setq haskell-stylish-on-save t)))

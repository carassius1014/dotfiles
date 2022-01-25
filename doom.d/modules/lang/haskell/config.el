;;; lang/haskell/config.el -*- lexical-binding: t; -*-

(use-package! haskell-mode
  :mode
  (("\\.hs\\'" . haskell-mode)
   ("\\.x\\'" . fundamental-mode)
   ("\\.y\\'" . fundamental-mode))
  :config
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  (setq haskell-stylish-on-save t)
  (haskell-formatter/reset))

(defun haskell-formatter/reset ()
  "Reset haskell formatter to $HASKELL_FORMATTER (default brittany)"
  (interactive)
  (let*
      ((mformatter (getenv "HASKELL_FORMATTER"))
       (formatter (if mformatter mformatter "brittany")))
    (setq haskell-mode-stylish-haskell-path formatter)))

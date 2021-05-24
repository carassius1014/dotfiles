;;; lang/haskell/config.el -*- lexical-binding: t; -*-

(use-package! haskell-mode
  :mode
  (("\\.hs\\'" . haskell-mode)
   ("\\.x\\'" . fundamental-mode)
   ("\\.y\\'" . fundamental-mode))
  :config
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  (add-hook 'buffer-list-update-hook 'setup-haskell-stylish-on-save))

(defun setup-haskell-stylish-on-save ()
  (let ((formatter (getenv "HASKELL_FORMATTER")))
    (if formatter
        (progn (setq haskell-mode-stylish-haskell-path formatter)
               (setq haskell-stylish-on-save t))
      (setq haskell-stylish-on-save nil))))

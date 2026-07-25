;;; lang/haskell/config.el -*- lexical-binding: t; -*-

(use-package! haskell-mode
  :mode
  (("\\.hs\\'" . haskell-mode)
   ("\\.x\\'" . fundamental-mode)
   ("\\.y\\'" . fundamental-mode))
  :config
  (add-hook 'haskell-mode-hook 'haskell-auto-insert-module-template)
  ;; Pass the buffer path so fourmolu can find the .cabal and honour its
  ;; default-extensions (fourmolu can't locate it from stdin alone).
  (add-hook 'haskell-mode-hook
            (lambda ()
              (when buffer-file-name
                (setq-local haskell-mode-stylish-haskell-args
                            (list "--stdin-input-file" buffer-file-name)))))
  (setq haskell-stylish-on-save t)
  (haskell-formatter/reset))

(defun haskell-formatter/reset ()
  "Reset haskell formatter to $HASKELL_FORMATTER (default fourmolu).
$HASKELL_FORMATTER is expected to be an executable that reads Haskell on
stdin and writes formatted output on stdout while keeping stderr quiet
\(haskell-mode aborts the format if the command writes to stderr).  The
Nix `hs-format' wrapper does exactly that."
  (interactive)
  (let ((formatter (or (getenv "HASKELL_FORMATTER") "fourmolu")))
    (setq haskell-mode-stylish-haskell-path formatter)))

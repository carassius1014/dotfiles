;;; -*- lexical-binding: t; -*-

(use-package proof-general
  :ensure t
  :config)

(use-package company-coq
  :ensure t
  :init
  (add-hook 'coq-mode-hook #'company-coq-mode))

(provide 'prelude-coq)

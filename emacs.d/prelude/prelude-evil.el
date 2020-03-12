;;; -*- lexical-binding: t; -*-

(use-package evil
  :ensure t
  :init
  (setq evil-disable-insert-state-bindings t)
  :config
  (evil-mode 1))

(provide 'prelude-evil)

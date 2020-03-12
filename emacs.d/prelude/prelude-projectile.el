;;; -*- lexical-binding: t; -*-

(use-package projectile
  :ensure t
  :config
  (projectile-mode +1)
  (setq projectile-switch-project-action #'projectile-dired))

(provide 'prelude-projectile)

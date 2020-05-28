;;; ~/.dotfiles/doom.d/config/projectile.el -*- lexical-binding: t; -*-

(use-package! projectile
  :config
  (projectile-mode +1)
  (setq projectile-switch-project-action #'projectile-dired))

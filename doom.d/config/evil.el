;;; ~/.dotfiles/doom.d/config/evil.el -*- lexical-binding: t; -*-

(after! evil
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state))

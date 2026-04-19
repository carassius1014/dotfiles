;;; ~/.dotfiles/doom.d/config/just.el -*- lexical-binding: t; -*-

(use-package! just-mode
  :mode ("/[Jj]ustfile\\'" . just-mode)
  :mode ("\\.just\\'" . just-mode))

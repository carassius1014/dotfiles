;;; ~/.dotfiles/doom.d/config/indents.el -*- lexical-binding: t; -*-

(advice-add #'doom-highlight-non-default-indentation-h :override #'ignore)

(after! highlight-indent-guides
  (setq highlight-indent-guides-method 'column))

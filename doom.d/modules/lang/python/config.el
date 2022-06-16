;;; lang/python/config.el -*- lexical-binding: t; -*-


(use-package! python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode))

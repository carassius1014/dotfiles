;;; lang/plantuml/config.el -*- lexical-binding: t; -*-

(use-package! plantuml-mode
  :mode "\\.plantuml\\'"
  :config
  (setq plantuml-executable-path "plantuml")
  (setq plantuml-default-exec-mode 'executable))

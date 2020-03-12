;;; -*- lexical-binding: t; -*-

(use-package neotree
  :ensure t
  :bind (([f8] . 'neotree-toggle))
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))

(provide 'prelude-neotree)

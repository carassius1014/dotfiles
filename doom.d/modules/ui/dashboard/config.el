;;; ui/dashboard/config.el -*- lexical-binding: t; -*-

(use-package! dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-center-content t)
  (setq dashboard-set-footer nil)
  (setq dashboard-items '((projects . 10)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t))

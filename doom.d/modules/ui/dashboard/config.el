;;; ui/dashboard/config.el -*- lexical-binding: t; -*-
(use-package! dashboard
  :config
  (setq dashboard-center-content t)
  (setq dashboard-projects-backend 'projectile)
  (setq dashboard-items
    '((projects . 10)))
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startupify-list
    '(dashboard-insert-banner
       dashboard-insert-newline
       dashboard-insert-banner-title
       dashboard-insert-newline
       dashboard-insert-navigator
       dashboard-insert-newline
       dashboard-insert-init-info
       dashboard-insert-items
       dashboard-insert-newline))
  (dashboard-setup-startup-hook))

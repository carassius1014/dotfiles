;;; -*- lexical-binding: t; -*-

(global-set-key (kbd "C-h") 'delete-backward-char)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq inhibit-startup-message t)
(fset 'yes-or-no-p 'y-or-n-p)

(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))

(provide 'prelude-better-defaults)

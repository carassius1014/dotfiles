;;; ~/.dotfiles/doom.d/config/tabs.el -*- lexical-binding: t; -*-

(use-package! centaur-tabs
  :config
  (defun centaur-tabs-hide-tab (x)
     (let ((name (format "%s" x)))
       (or
        (string-prefix-p "*dashboard*" name)
        (string-prefix-p "*direnv*" name)
        (string-prefix-p "*Messages*" name)
        (string-prefix-p "*Straight" name)
        (and (string-prefix-p "(message "")agit" name)
             (not (file-name-extension name)))))))

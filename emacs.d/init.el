;;; -*- lexical-binding: t; -*-

(add-to-list 'load-path (expand-file-name "prelude" user-emacs-directory))


(require 'prelude)

(require 'prelude-repository)
(require 'prelude-use-package)

(require 'prelude-better-defaults)
(require 'prelude-path)
(require 'prelude-macos)

(require 'prelude-frame)
(require 'prelude-font)
(require 'prelude-theme)
(require 'prelude-icons)
(require 'prelude-dashboard)
(require 'prelude-neotree)
(require 'prelude-projectile)

(require 'prelude-evil)
(require 'prelude-ivy)
(require 'prelude-company)
(require 'prelude-which-key)
(require 'prelude-undo-tree)

(require 'prelude-magit)

(require 'prelude-emacs-lisp)

(provide 'init)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (projectile neotree all-the-icons-dired all-the-icons-ivy all-the-icons which-key exec-path-from-shell evil-magit magit dashboard company counsel evil doom-themes use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

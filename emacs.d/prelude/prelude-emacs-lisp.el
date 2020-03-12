;;; -*- lexical-binding: t; -*-

(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (let  ((auto-insert-query nil)
                   (auto-insert-alist
		    '((("\\.el\\'" . "Emacs Lisp header")
		       ""
		       ";;; -*- lexical-binding: t; -*-\n\n" '(setq lexical-binding t)))))
              (auto-insert))))

(provide 'prelude-emacs-lisp)


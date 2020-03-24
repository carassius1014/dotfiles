;;; -*- lexical-binding: t; -*-

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")

(use-package tide
  :ensure t
  :init
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (add-hook 'js2-mode-hook #'setup-tide-mode)
  :config
  (setq company-tooltip-align-annotations t)
  (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append))

(use-package web-mode
  :ensure t
  :mode ("\\.jsx\\'" "\\.tsx\\'")
  :init
  (add-hook 'web-mode-hook
	    (lambda ()
	      (when (string-equal "tsx" (file-name-extension buffer-file-name))
		(setup-tide-mode))))
  (add-hook 'web-mode-hook
	    (lambda ()
	      (when (string-equal "jsx" (file-name-extension buffer-file-name))
		(setup-tide-mode))))
  :config
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append))

(provide 'prelude-javascript)

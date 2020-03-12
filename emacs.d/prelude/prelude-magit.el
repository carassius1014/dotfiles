;;; -*- lexical-binding: t; -*-

(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status)
	 ("C-x M-g" . magit-dispatch-popup))
  :init
  :config
  (setq magit-display-buffer-function
	(lambda (buffer)
	  (display-buffer
	   buffer (if (and (derived-mode-p 'magit-mode)
			   (memq (with-current-buffer buffer major-mode)
				 '(magit-process-mode
				   magit-revision-mode
				   magit-diff-mode
				   magit-stash-mode
				   magit-status-mode)))
		      nil
		    '(display-buffer-same-window))))))

(use-package evil-magit
  :ensure t)

(provide 'prelude-magit)

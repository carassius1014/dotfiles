;;; -*- lexical-binding: t; -*-

(if (eq system-type 'darwin)
    (setq default-frame-alist
	  (append
	   (list '(font . "Sarasa Mono CL-18"))
	   default-frame-alist))
  (setq default-frame-alist
	(append
	 (list '(font . "Sarasa Mono CL-14"))
	 default-frame-alist)))

(provide 'prelude-font)

;;; -*- lexical-binding: t; -*-

(tool-bar-mode -1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))

(provide 'prelude-frame)


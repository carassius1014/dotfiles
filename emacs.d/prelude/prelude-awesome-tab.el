;;; -*- lexical-binding: t; -*-

(use-package awesome-tab
  :load-path "repositories/awesome-tab"
  :config
  (awesome-tab-mode t)
  (global-set-key (kbd "C-1") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "C-2") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "C-3") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "C-4") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "C-5") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "C-6") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "C-7") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "C-8") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "C-9") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "C-0") 'awesome-tab-select-visible-tab))

(provide 'prelude-awesome-tab)

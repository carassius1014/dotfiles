;;; -*- lexical-binding: t; -*-

(require 'prelude)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(provide 'prelude-use-package)

;;; -*- lexical-binding: t; -*-

(let ((path-from-shell (shell-command-to-string "/usr/bin/env fish -i -c \"echo -n \\$PATH[1]; for val in \\$PATH[2..-1];echo -n \\\":\\$val\\\";end\"")))
  (setenv "PATH" path-from-shell)
  (setq exec-path (split-string path-from-shell ":")))

(provide 'prelude-path)

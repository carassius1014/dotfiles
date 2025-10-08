#!/usr/bin/env sh

emacs --batch "$1" --eval '(progn (mark-whole-buffer) (indent-region (point-min) (point-max)) (delete-trailing-whitespace) (save-buffer))'

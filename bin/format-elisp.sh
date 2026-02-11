#!/usr/bin/env sh

if [ -z "$1" ]; then
  echo "Usage: $0 <file.el>" >&2
  exit 1
fi

emacs --batch "$1" --eval '(progn (mark-whole-buffer) (indent-region (point-min) (point-max)) (delete-trailing-whitespace) (save-buffer))'

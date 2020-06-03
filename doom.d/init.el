;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company
       ivy

       :ui
       dashboard
       doom
       hl-todo
       indent-guides
       modeline
       ophints
       (popup +defaults)
       tabs
       treemacs
       unicode
       vc-gutter
       vi-tilde-fringe
       window-select
       workspaces

       :editor
       (evil +everywhere)
       file-templates
       fold
       snippets

       :emacs
       dired+
       electric
       ibuffer
       undo
       vc

       :term
       eshell

       :checkers
       syntax

       :tools
       direnv
       editorconfig
       (eval +overlay)
       lookup
       magit

       :lang
       emacs-lisp
       haskell
       javascript
       json
       latex
       markdown
       nix
       ocaml
       org
       python
       racket
       sh
       yaml

       :config
       (default +bindings +smartparens))

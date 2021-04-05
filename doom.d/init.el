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
       docker
       editorconfig
       (eval +overlay)
       lookup
       lsp
       magit

       :lang
       coq
       emacs-lisp
       haskell
       javascript
       json
       latex
       markdown
       nix
       ocaml
       org
       protobuf
       purescript
       racket
       rust
       sh
       yaml

       :config
       (default +bindings +smartparens))

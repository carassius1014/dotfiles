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

       :editor
       (evil +everywhere)
       file-templates
       fold
       snippets

       :emacs
       (dired +icons)
       electric
       ibuffer
       undo
       vc

       :term
       vterm

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
       terraform

       :lang
       (agda +local)
       coq
       dhall
       emacs-lisp
       haskell
       javascript
       json
       latex
       markdown
       nix
       org
       protobuf
       purescript
       (rust +lsp)
       sh
       yaml

       :config
       (default +bindings +smartparens))

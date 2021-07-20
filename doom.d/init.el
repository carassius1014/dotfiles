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

       :lang
       (agda +local)
       coq
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

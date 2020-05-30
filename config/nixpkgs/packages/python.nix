{ pkgs, ... }:

with pkgs;
let
  my-packages = python-pkgs:
    with python-pkgs;
    [ editorconfig
      isort
      nose
      pygments
      pytest
    ];
in python3.withPackages my-packages

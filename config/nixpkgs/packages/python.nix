{ pkgs, ... }:

with pkgs;
buildEnv {
  name = "python-pkgs";
  paths = with python38Packages; [ editorconfig isort nose pygments pytest ];
}

{ pkgs, ... }:

with pkgs;
buildEnv {
  name = "ocaml-pkgs";
  paths = with ocamlPackages; [ merlin ocp-indent utop ];
}

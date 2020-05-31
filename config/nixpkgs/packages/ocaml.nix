{ pkgs, ... }:

with pkgs;
buildEnv {
  name = "ocaml-pkgs";
  paths = with ocamlPackages; [ dune merlin ocp-indent utop ];
}

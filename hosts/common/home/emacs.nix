{ pkgs, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomDir = ../../../doom.d;
    emacs = pkgs.emacs-pgtk;
    extraPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
    ];
  };
}

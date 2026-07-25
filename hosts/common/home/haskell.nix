{ pkgs, ... }:

let
  # fourmolu reading stdin, with stderr silenced so haskell-mode does not
  # treat warnings as a failure and abort the on-save format. Tweak the flags
  # here (e.g. add --stdin-input-name) rather than in Emacs.
  hs-format = pkgs.writeShellScriptBin "hs-format" ''
    exec ${pkgs.fourmolu}/bin/fourmolu "$@" 2>/dev/null
  '';
in
{
  # fourmolu picks this up as the global fallback config
  # ($XDG_CONFIG_HOME/fourmolu.yaml) when no project fourmolu.yaml is found.
  xdg.configFile."fourmolu.yaml".text = ''
    indentation: 2
    comma-style: leading
    import-export-style: diff-friendly
    respectful: true
  '';

  # stack's global project (used when running stack outside a project).
  # lts-24 tracks GHC 9.10.x, matching the nix `ghc`; system-ghc reuses it
  # (compiler-check defaults to match-minor, so the 9.10.3 patch is fine).
  home.file.".stack/global-project/stack.yaml".text = ''
    snapshot: lts-24
    packages: []
    system-ghc: true
    install-ghc: false
  '';

  home.packages = [ hs-format ];
  home.sessionVariables.HASKELL_FORMATTER = "${hs-format}/bin/hs-format";
}

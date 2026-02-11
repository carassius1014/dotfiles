{
  config,
  pkgs,
  lib,
  ...
}:

let
  inherit (pkgs) gctx;
  nerd-fonts-pkgs = builtins.filter lib.attrsets.isDerivation (builtins.attrValues pkgs.nerd-fonts);
in
{
  imports = [ ../common/configuration/nix.nix ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    coreutils-prefixed
    fd
    fontconfig
  ];

  programs.zsh.enable = true;
  environment.shells = [ pkgs.zsh ];
  users.users.${gctx.me.name} = {
    home = "/Users/${gctx.me.name}";
    shell = pkgs.zsh;
  };
  system.activationScripts.postActivation.text = ''
    # Set the default shell as zsh for the user. MacOS doesn't do this like nixOS does
    sudo chsh -s ${lib.getBin pkgs.zsh}/bin/zsh ${gctx.me.name}
  '';

  fonts.packages =
    with pkgs;
    nerd-fonts-pkgs
    ++ [
      sarasa-gothic
    ];

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  ids.gids.nixbld = 350;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

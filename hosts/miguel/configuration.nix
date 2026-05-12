{
  config,
  pkgs,
  lib,
  homebrew-cask,
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

  nix-homebrew = {
    enable = true;
    user = gctx.me.name;
    taps = {
      "homebrew/homebrew-cask" = homebrew-cask;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    casks = [ "docker-desktop" ];
  };

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

  system.primaryUser = gctx.me.name;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

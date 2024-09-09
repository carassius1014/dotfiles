{ config, pkgs, lib, ... }:

let inherit (pkgs) gctx;
in {
  imports = [ ../common/configuration/nix.nix ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ coreutils-prefixed fd fontconfig ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.configureBuildUsers = true;

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

  fonts.packages = with pkgs; [ nerdfonts sarasa-gothic ];

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

{ config, pkgs, lib, ... }:

let inherit (pkgs) gctx;
in {
  imports =
    [ ../common/configuration/emacs.nix ../common/configuration/nix.nix ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ coreutils emacs fd fontconfig ];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  nix.configureBuildUsers = true;

  programs.fish.enable = true;
  environment.shells = [ pkgs.fish ];
  users.users.${gctx.me.name} = {
    home = "/Users/${gctx.me.name}";
    shell = pkgs.fish;
  };
  system.activationScripts.postActivation.text = ''
    # Set the default shell as fish for the user. MacOS doesn't do this like nixOS does
    sudo chsh -s ${lib.getBin pkgs.fish}/bin/fish ${gctx.me.name}
  '';

  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [ nerdfonts sarasa-gothic ];

  # Keyboard
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}

{
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.carassius1014 = {
    isNormalUser = true;
    extraGroups = [ "audio" "docker" "wheel" "sound" ];
    shell = "/run/current-system/sw/bin/fish";
  };
}

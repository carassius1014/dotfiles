{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    emacs
    git
  ];
}

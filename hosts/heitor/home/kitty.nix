{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    font = {
      package = pkgs.sarasa-gothic;
      name = "Sarasa Term J";
      size = 14;
    };
  };
}

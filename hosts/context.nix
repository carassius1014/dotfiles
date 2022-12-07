{ pkgs, ... }:

{ # global context
  fonts = {
    package = pkgs.sarasa-gothic;
    mono = "Sarasa Mono J";
    term = "Sarasa Fixed J";
    ui = "Sarasa UI J";
  };
}

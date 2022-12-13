{ pkgs, ... }:

{ # global context
  me = rec {
    name = "carassius1014";
    realName = "Jiyu Zhou";
    email = "${name}@gmail.com";
  };

  fonts = {
    package = pkgs.sarasa-gothic;
    mono = "Sarasa Mono J";
    term = "Sarasa Fixed J";
    ui = "Sarasa UI J";
  };
}

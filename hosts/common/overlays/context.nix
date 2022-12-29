self: super: {
  # global context
  gctx = {
    me = rec {
      name = "carassius1014";
      realName = "Jiyu Zhou";
      email = "${name}@gmail.com";
    };

    fonts = {
      package = self.sarasa-gothic;
      mono = "Sarasa Mono J";
      term = "Sarasa Fixed J";
      ui = "Sarasa UI J";
    };
  };
}

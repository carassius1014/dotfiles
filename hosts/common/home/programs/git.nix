{
  programs.git = {
    enable = true;
    userName = "Jiyu Zhou";
    userEmail = "carassius1014@gmail.com";
    ignores = [ ".direnv" ];
    extraConfig = { init = { defaultBranch = "master"; }; };
  };
}

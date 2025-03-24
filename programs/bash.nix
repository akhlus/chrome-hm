{settings, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "python" = "python3";
      "py" = "python3";
      "home" = "python3 ${settings.flakePath}/update.py home True";
      "hs" = "python3 ${settings.flakePath}/update.py home True switch";
    };
  };
}

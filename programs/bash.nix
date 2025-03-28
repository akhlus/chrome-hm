{settings, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "python" = "python3";
      "py" = "python3";
      "home" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath}";
      "hs" = "sh ${settings.flakePath}/update.sh -p ${settings.flakePath} -m switch";
      "update" = "sudo apt update && sudo apt upgrade -y";
    };
  };
}

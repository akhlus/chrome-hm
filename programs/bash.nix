{flakePath, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "python" = "python3";
      "py" = "python3";
      "home" = "sh ${flakePath}/update.sh -p ${flakePath}";
      "hs" = "sh ${flakePath}/update.sh -p ${flakePath} -m switch";
      "update" = "sudo apt update && sudo apt upgrade -y";
    };
  };
}

{settings, ...}: {
  programs.bash = {
    enable = true;
    shellAliases = {
      "ll" = "ls -l";
      ".." = "cd ..";
      "lla" = "ls -la";
      "python" = "python3";
      "py" = "python3";
      "home" = "home-manager --flake ${settings.flakePath}#home";
      "hs" = "home-manager --flake ${settings.flakePath}#home switch";
      "update" = "sudo apt update && sudo apt upgrade -y";
    };
  };
}

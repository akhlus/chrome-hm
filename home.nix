{pkgs, settings, ...}: {
  programs.home-manager.enable = true;

  home.username = "${settings.name}";
  home.homeDirectory = "/home/${settings.name}";

  imports = [
    ./programs/bash.nix
    ./programs/btop.nix
    ./programs/git.nix
    ./programs/vscode.nix
    ./programs/xournalpp.nix
  ];

  home.packages = with pkgs; [
    alejandra
    fastfetch
    gh
    gnome-text-editor
    inter
    kgx
    kdePackages.dolphin
    mpv
    nano
    nixd
    source-code-pro
    tldr
    ungit
    wget
  ];

  fonts.fontconfig.enable = true;

  home.sessionVariables = {
    FLAKE_PATH = "${settings.flakePath}";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';

  nixpkgs.config.allowUnfree = true;
}

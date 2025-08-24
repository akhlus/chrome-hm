{flakePath, ...}: {
  programs.home-manager.enable = true;

  imports = [
    ./programs
  ];

  home = {
    username = "sam";
    homeDirectory = "/home/sam";
    sessionVariables = {FLAKE_PATH = "${flakePath}";};
    stateVersion = "24.11";
  };

  fonts.fontconfig.enable = true;

  xdg.configFile."systemd/user/cros-garcon.service.d/override.conf".text = ''
    [Service]
    Environment="PATH=%h/.nix-profile/bin:/usr/local/sbin:/usr/local/bin:/usr/local/games:/usr/sbin:/usr/bin:/usr/games:/sbin:/bin"
    Environment="XDG_DATA_DIRS=%h/.nix-profile/share:%h/.local/share:%h/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share"
  '';

  nixpkgs.config.allowUnfree = true;
}

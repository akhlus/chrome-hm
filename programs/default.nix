{pkgs, ...}: {
  imports = [
    ./xournalpp
    ./git.nix
    ./bash.nix
    ./vscode.nix
  ];
  home.packages = with pkgs; [
    alejandra
    fastfetch
    gh
    git
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
}

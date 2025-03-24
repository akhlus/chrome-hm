{
  pkgs,
  config,
  settings,
  ...
}: {
  home.packages = [pkgs.xournalpp];
  home.file = {
    ".config/xournalpp/palette.gpl".source = ./files/palette.gpl;
    ".config/xournalpp/toolbar.ini".source = ./files/toolbar.ini;
    ".config/xournalpp/settings.xml".source = config.lib.file.mkOutOfStoreSymlink "${settings.flakePath}/programs/files/xournalpp-settings.xml";
  };
}

{
  settings,
  config,
  ...
}: {
  home.file = {
    ".config/git/config".source = config.lib.file.mkOutOfStoreSymlink "${settings.flakePath}/programs/files/git-config";
  };
}

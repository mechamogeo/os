{ user, root, pkgs, ... }:

{
  home-manager.users.${user} = { config, lib, ... }:
    let
      xdg_home = config.home.homeDirectory;
      xdg_appSupport = "${xdg_home}/Library/Application Support";

      # Symlinks definitions
      useLocal = rel: config.lib.file.mkOutOfStoreSymlink "${root}/modules/dotfiles/${rel}";
    in
    {
      home.file = {
        "${xdg_home}/.ssh" = { source = ./ssh; recursive = true; };
        "${xdg_home}/.local/bin" = { source = ./bin; recursive = true; };
        "${xdg_appSupport}/nushell" = { source = ./nushell; recursive = true; };
      };
    };
}

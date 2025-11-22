{ user, root, pkgs, ... }:

{
  home-manager.users.${user} = { config, lib, ... }:
    let
      xdg_home = config.home.homeDirectory;
      xdg_configHome = "${xdg_home}/.config";
      xdg_appSupport = "${xdg_home}/Library/Application Support";
      zsh-autosuggestions = pkgs.callPackage ./zsh-autosuggestions.nix { };

      # Symlinks to a place in this repo so we can edit them without rebuilding the system
      useLocal = rel: config.lib.file.mkOutOfStoreSymlink "${root}/modules/dotfiles/${rel}";
    in
    {
      home.file = {
        "${xdg_home}/bin".source = useLocal "bin";
        "${xdg_home}/.ssh" = { source = ./ssh; recursive = true; };
        "${xdg_appSupport}/nushell" = { source = ./nushell; recursive = true; };
      };
    };
}

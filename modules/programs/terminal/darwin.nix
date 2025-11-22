{ user, pkgs, git-user, ... }:

{
  imports = [
    (import ./default.nix { inherit user pkgs git-user; })
  ];

  home-manager.users.${user} = { ... }: {
    home.packages = with pkgs; [
      gnused # Fix macOS sed and grep
      gnugrep # Fix macOS sed and grep
    ];
  };
}

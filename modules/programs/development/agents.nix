{ user, pkgs }:

{
  home-manager.users.${user} = { config, lib, ... }: {
    home = {
      packages = [
        pkgs.gemini-cli
        pkgs.copilot-cli
        pkgs.spec-kit
      ];
    };
  };
}

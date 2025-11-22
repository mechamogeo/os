{ user, pkgs, ... }:

{
  home-manager.users.${user} = { ... }: {
    home.packages = with pkgs; [
      docker-compose
      google-cloud-sdk
      kind
      podman
      qemu # for podman
      opentofu
    ];
  };
}

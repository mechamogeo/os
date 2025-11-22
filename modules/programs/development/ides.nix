{ user, pkgs, ... }:

{
  home-manager.users.${user} = { ... }: {
    home.packages = with pkgs; [
      aspell
      libtool
      gnumake
      autoconf
      automake
      vhs

      # Languages
      ## Golang
      go
      delve

      ## Python
      pyright
      ruff
      uv

      ## JS/TS
      bun
      fnm

      ## Misc
      elixir
    ];
  };
}

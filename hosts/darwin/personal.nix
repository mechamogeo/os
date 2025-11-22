{ pkgs, mac-app-util, ... }:

let
  user = "geo";
  machine = "personal";
  home = "/Users/${user}";
  root = "${home}/os";

  git-user = {
    name = "Geovani Perez França";
    email = "geovanipfranca@gmail.com";
  };

  modules = path: args: if args == null then ../../modules + path else import (../../modules + path) args;
in
{
  imports = [
    # Common configuration for all machines
    (modules /nix.nix { inherit user pkgs; buildId = 352; })
    (modules /nixpkgs.nix null)
    (modules /fonts.nix { inherit pkgs; })

    # Darwin-specific configuration
    (modules /darwin/settings.nix { inherit user machine; stateVersion = 5; })
    (modules /darwin/user.nix { inherit user pkgs home; })
    (modules /darwin/home-manager.nix { inherit user mac-app-util; stateVersion = "23.11"; })

    # Development
    (modules /programs/development/cloud.nix { inherit user pkgs; })
    (modules /programs/development/ides.nix { inherit user pkgs; })
    (modules /programs/development/agents.nix { inherit user pkgs; })

    # Homebrew and casks
    (modules /programs/homebrew/darwin.nix null)
    (modules /programs/homebrew/zed.nix null)
    (modules /programs/homebrew/docker.nix null)
    (modules /programs/homebrew/ollama.nix null)
    (modules /programs/homebrew/tailscale.nix null)

    # Terminal and Dotfiles
    (modules /programs/terminal/darwin.nix { inherit user pkgs git-user; })
    (modules /dotfiles/default.nix { inherit user pkgs root; })

    # GUI Applications
    (modules /programs/1password/darwin.nix null)

    # DMG Things
    (modules /programs/pulse/darwin.nix { inherit user pkgs; })
    (modules /programs/browsers/dia/darwin.nix { inherit user pkgs; })
  ];
}

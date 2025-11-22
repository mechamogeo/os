{ user, pkgs, git-user, ... }:

{
  home-manager.users.${user} = { ... }: {
    home.packages = with pkgs; [
      bash-completion
      bat
      gh
      ripgrep
      tree
      wget
      zoxide
      direnv
    ];

    programs.difftastic = {
      enable = true;
      git.enable = true;
      options = {
        background = "dark";
      };
    };

    programs.nushell = {
      enable = true;
      plugins = [ pkgs.nushellPlugins.query ];
    };

    programs.direnv = {
      enable = true;
      enableNushellIntegration = true;
      nix-direnv.enable = true;
    };

    programs.zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    programs.git = {
      enable = true;
      ignores = [ "*.swp" ".DS_Store" ];
      lfs = {
        enable = true;
      };
      settings = {
        init.defaultBranch = "main";
        pull.rebase = true;
        rebase.autoStash = true;
        push.autoSetupRemote = true;
        user = {
          name = git-user.name;
          email = git-user.email;
        };
        core = {
          editor = "zed";
        };
        url = {
          "ssh://git@github.com/" = {
            insteadOf = "https://github.com/";
          };
        };
      };
    };
  };
}

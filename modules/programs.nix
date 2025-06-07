{ config, lib, pkgs, ... }:

{
  programs = {
    # GPG Agent
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;

      ohMyZsh = {
        enable = true;
        plugins = [ "git" "sudo" "docker" "vi-mode" "laravel" "golang" ];
        theme = "af";
        custom = "$HOME/.oh-my-zsh";
      };
    };

    # Git configuration
    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user = {
          name = "Amirhossein Fazli";
          email = "amirhossein95b@gmail.com";
        };
      };
    };

    # Firefox
    firefox.enable = true;

    nekoray = {
      tunMode.enable = true;
    };
  };
}

{ config, pkgs, ... }:

{
  home = {
    username = "amirhossein";
    homeDirectory = "/home/amirhossein";
    stateVersion = "25.05";

    packages = with pkgs; [
      # Add packages here
    ];
  };

  fonts = {
    fontconfig = {
      enable = true;
    };
  };

  # Programs
  programs = {
    home-manager = {
      enable = true;
    };

    zsh = {
      enable = true;
      initContent = ''
        export GOPROXY=https://goproxy.io,direct;
      '';
      shellAliases = {
        php = "php74";
        composer = "composer74";
      };
    };
  };

  # Services
  services = {
    # Configure services specific to this user
  };
}


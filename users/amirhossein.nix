{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "amirhossein";
  home.homeDirectory = "/home/amirhossein";

  # This value determines the Home Manager release that your
  # configuration is compatible with.
  home.stateVersion = "25.05";

  # User-specific packages
  home.packages = with pkgs; [
    # Add user-specific packages here
    # These will be installed only for this user
  ];

  # User-specific program configurations
  programs = {
    # Configure programs specific to this user
    # Example:
    # git = {
    #   enable = true;
    #   userName = "Amirhossein Fazli";
    #   userEmail = "amirhossein95b@gmail.com";
    # };
  };

  # User-specific services
  services = {
    # Configure services specific to this user
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}


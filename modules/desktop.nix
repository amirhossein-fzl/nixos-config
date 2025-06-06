{ config, lib, pkgs, ... }:

{
  # X11 and Wayland
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "eurosign:e,caps:escape";
    };
  };

  # Desktop Environment
  services.desktopManager.plasma6.enable = true;

  # Display Manager
  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
    };
    defaultSession = "plasma";
  };

  # Input
  services.libinput.enable = true;

  # Plasma package exclusions
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    khelpcenter
  ];

  # System services for display manager
  systemd.services.display-manager = {
    wants = [ "systemd-user-sessions.service" ];
    after = [
      "systemd-user-sessions.service"
      "plymouth-quit-wait.service"
      "getty@tty1.service"
    ];
  };

  # Disable getty on tty1 to prevent conflict with display manager
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}

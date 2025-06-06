{ config, lib, pkgs, ... }:

{
  services = {
    # System services
    openssh.enable = true;
    printing.enable = true;

    # Audio
    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };

    # Power management
    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        START_CHARGE_THRESH_BAT0 = 85;
        STOP_CHARGE_THRESH_BAT0 = 85;

        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        USB_AUTOSUSPEND = 1;

        RUNTIME_PM_ON_AC = "auto";
        RUNTIME_PM_ON_BAT = "auto";
      };
    };

    # Databases
    mysql = {
      enable = true;
      package = pkgs.mariadb;
    };

    postgresql.enable = true;

    # Shell history
    atuin.enable = true;

    # AI/ML
    ollama.enable = false;
  };
}


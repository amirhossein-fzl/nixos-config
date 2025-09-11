{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      options = "eurosign:e,caps:escape";
    };
  };

  services.desktopManager.plasma6.enable = true;

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
      autoNumlock = true;
    };
    defaultSession = "plasma";
  };

  services.libinput.enable = true;

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    khelpcenter
  ];

  systemd.services.display-manager = {
    wants = [ "systemd-user-sessions.service" ];
    after = [
      "systemd-user-sessions.service"
      "plymouth-quit-wait.service"
      "getty@tty1.service"
    ];
  };

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}

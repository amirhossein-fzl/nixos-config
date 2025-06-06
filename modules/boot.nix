{ config, lib, pkgs, ... }:

{
  boot = {
    # Use latest kernel
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "numlock=1" ];

    # Bootloader configuration
    loader = {
      grub = {
        enable = true;
        copyKernels = true;
        efiSupport = true;
        device = "nodev";
        enableCryptodisk = true;
        useOSProber = true;
        extraEntries = ''
          menuentry "Reboot" {
            reboot
          }
          menuentry "Poweroff" {
            halt
          }
        '';
      };

      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };
    };
  };

  # ZRAM Swap configuration
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryMax = 8518631424; # 8GB
    swapDevices = 1;
  };
}

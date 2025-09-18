{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [ "numlock=1" ];

    loader = {
      grub = {
        enable = true;
        copyKernels = true;
        efiSupport = true;
        device = "nodev";
        enableCryptodisk = true;
        extraEntries = ''
          menuentry 'Arch Linux (on /dev/nvme0n1p5)' --class arch --class gnu-linux --class gnu --class os {
            insmod part_gpt
            insmod fat
            search --no-floppy --fs-uuid --set=root 1A1D-D728
            linux /archlinux/vmlinuz-linux root=UUID=2b3b0e2f-01b1-4345-8475-688555f92e4e numlock=1 loglevel=4 lsm=landlock,yama,bpf
            initrd /archlinux/initramfs-linux.img
          }
          menuentry 'Windows Boot Manager (on /dev/nvme0n1p1)' --class windows --class os {
            insmod part_gpt
            insmod fat
            search --no-floppy --fs-uuid --set=root 1A1D-D728
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
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
}

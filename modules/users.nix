{ config, lib, pkgs, ... }:

{
  users = {
    defaultUserShell = pkgs.zsh;
    
    users.amirhossein = {
      isNormalUser = true;
      home = "/home/amirhossein";
      description = "Amirhossein Fazli";
      extraGroups = [ "wheel" "networkmanager" "libvirt" "libvirt-qemu" "kvm" ];
    };
  };
}


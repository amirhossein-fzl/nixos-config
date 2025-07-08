{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../modules/boot.nix
    ../modules/networking.nix
    ../modules/localization.nix
    ../modules/hardware.nix
    ../modules/desktop.nix
    ../modules/services.nix
    ../modules/security.nix
    ../modules/users.nix
    ../modules/virtualisation.nix
  ];

  # Allow unfree packages
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (import ../overlays/networkmanager-pptp.nix)
    ];
  };

  # Enable flakes and nix-command
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # System state version
  system.stateVersion = "25.05";
}

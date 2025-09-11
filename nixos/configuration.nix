{ config, lib, pkgs, ... }:

{
  system.stateVersion = "25.05";

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
    ../modules/swap.nix
    ../modules/nix.nix
    ../modules/nixpkgs.nix
  ];
}

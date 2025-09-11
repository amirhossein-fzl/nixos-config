{ config, lib, pkgs, ... }:

{
  system.stateVersion = "25.05";

  imports = [
    ./hardware-configuration.nix
    ../modules
  ];
}

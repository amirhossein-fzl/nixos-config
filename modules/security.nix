{ config, lib, pkgs, ... }:

{
  security = {
    # Use sudo-rs instead of sudo
    sudo.enable = false;
    sudo-rs.enable = true;
  };
}


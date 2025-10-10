{ pkgs, ... }:

{
  networking = {
    hostName = "nixos";
    firewall = rec {
      allowedTCPPorts = [ 1723 ]; # PPTP control port
      # PPTP uses GRE protocol (IP protocol 47)
      extraCommands = ''
        iptables -A INPUT -p gre -j ACCEPT
        iptables -A OUTPUT -p gre -j ACCEPT
      '';

      # Kde connect
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
    networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-pptp
      ];
    };
  };
}


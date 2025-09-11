{ pkgs, ... }:

{
  networking = {
    hostName = "nixos";
    firewall = {
      allowedTCPPorts = [ 1723 ]; # PPTP control port
      # PPTP uses GRE protocol (IP protocol 47)
      extraCommands = ''
        iptables -A INPUT -p gre -j ACCEPT
        iptables -A OUTPUT -p gre -j ACCEPT
      '';
    };
    networkmanager = {
      enable = true;
      plugins = [
        pkgs.networkmanager-pptp
      ];
    };
  };
}


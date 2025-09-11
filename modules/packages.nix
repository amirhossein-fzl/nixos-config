{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System utilities requiring root access
    ntfs3g
    iptables
    networkmanager-pptp
    pptp
    ppp
    
    # System services and daemons
    docker-compose
    podman-compose
    postgresql
    mariadb
    redis
    rabbitmq-server
    nginx
    
    # Virtualization (needs system-level access)
    virt-manager
    qemu
    libvirt
    
    # System-wide development dependencies
    gcc
    libgcc
    gnumake
    gtk4
    pkg-config
  ];
}

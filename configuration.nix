{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Boot configuration
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

  # Network configuration
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  # Localization
  time.timeZone = "Asia/Tehran";
  i18n.defaultLocale = "en_US.UTF-8";

  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  # X11 and desktop environment
  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        options = "eurosign:e,caps:escape";
      };
    };

    desktopManager.plasma6.enable = true;
    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        autoNumlock = true;
      };
      defaultSession = "plasma";
    };

    printing.enable = true;
    libinput.enable = true;
    openssh.enable = true;

    pipewire = {
      enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
      pulse.enable = true;
    };
  };

  # User configuration
  users = {
    defaultUserShell = pkgs.zsh;
    users.amirhossein = {
      isNormalUser = true;
      home = "/home/amirhossein";
      description = "Amirhossein Fazli";
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };

  # System packages
  environment.systemPackages = with pkgs; [
    firefox
    vim
    neovim
    curl
    wget
    git
    kitty
    nekoray
    telegram-desktop
    onefetch
    htop
    neovim
    vscode
    vlc
    mpv
    go
    php
    docker
    docker-compose
    fastfetch
    tree
    rustup
    postamn
    gcc
    libgcc
    home-manager
    dbeaver-bin
    zig
    gnumake
    gtk4
    speedcrunch
    python313
    nodejs_24
    bun
    ffmpeg
    tmux
    podman
    youtube-dl
    scdl
    postgresql
    mariadb
    redis
    redisinsight
    rabbitmq-server
    nginx
    atuin
    ollama
  ];

  # Programs
  programs = {
    firefox.enable = true;

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;

      ohMyZsh = {
        enable = true;
        plugins = [ "git" "sudo" "docker" "vi-mode" "laravel" ];
        theme = "agnoster";
      };
    };
  };

  # Security
  security = {
    sudo.enable = false;
    sudo-rs.enable = true;
  };

  # System configuration
  systemd.services.display-manager.wants = [
    "systemd-user-sessions.service"
  ];

  systemd.services.display-manager.after = [
    "systemd-user-sessions.service"
    "plymouth-quit-wait.service"
    "getty@tty1.service"
  ];

  # Disable getty on tty1 to prevent conflict with display manager
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # Swap
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryMax = "8G";
    swapDevices = 1;
  };

  # System configuration
  system = {
    copySystemConfiguration = true;
    stateVersion = "25.05";
  };
}

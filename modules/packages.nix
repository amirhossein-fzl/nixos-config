{ config, lib, pkgs, nix2111Pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # System utilities
    curl
    wget
    htop
    fastfetch
    tree
    tmux
    aria2

    # Text editors and IDEs
    vim
    neovim
    vscode

    # Version control
    git
    onefetch

    # Browsers and communication
    firefox
    telegram-desktop
    google-chrome

    # Media
    vlc
    mpv
    ffmpeg
    yt-dlp
    scdl

    # Development tools
    gcc
    libgcc
    gnumake
    gtk4

    # Programming languages and runtimes
    go

    # PHP
    (writeShellScriptBin "php84" ''
      exec ${php}/bin/php "$@"
    '')
    (writeShellScriptBin "php74" ''
      exec ${nix2111Pkgs.php74}/bin/php "$@"
    '')
    (writeShellScriptBin "composer84" ''
      exec ${php84Packages.composer}/bin/composer "$@"
    '')
    (writeShellScriptBin "composer74" ''
      exec ${nix2111Pkgs.php74Packages.composer}/bin/composer "$@"
    '')

    python313
    nodejs_24
    bun
    rustup
    zig

    # Containerization
    docker
    docker-compose
    podman

    # Databases and database tools
    postgresql
    mariadb
    redis
    #redisinsight
    dbeaver-bin

    # Server software
    rabbitmq-server
    nginx

    # Development tools
    postman

    # Utilities
    speedcrunch
    home-manager

    # AI/ML tools
    ollama

    # Shell and terminal
    atuin

    # Networking and VPN
    nekoray

    # KDE Connect
    kdePackages.kdeconnect-kde

  ];
}

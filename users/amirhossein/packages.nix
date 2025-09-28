{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # CLI utilities
    curl
    wget
    htop
    fastfetch
    tree
    aria2
    zip
    killall
    wl-clipboard
    qrencode
    tdl
    onefetch

    # Text editors and IDEs
    vim
    neovim
    vscode
    zed-editor
    
    # Browsers and communication
    firefox
    telegram-desktop
    google-chrome
    thunderbird
    brave
    
    # Media applications
    vlc
    mpv
    ffmpeg
    yt-dlp
    scdl
    kdePackages.kdenlive
    inkscape
    
    # Development tools
    git
    jq
    upx
    just
    postman
    fpm
    rpm
    
    # Programming languages and runtimes
    go
    python313
    nodejs_24
    bun
    rustup
    zig
    pnpm
    
    # Your custom PHP scripts
    (writeShellScriptBin "php84" ''
      exec ${php}/bin/php "$@"
    '')
    (writeShellScriptBin "php83" ''
      exec ${(php83.buildEnv {
        extensions = ({ enabled, all }: enabled ++ (with all; [
          redis
        ]));
      })}/bin/php "$@"
    '')
    (writeShellScriptBin "composer84" ''
      exec ${php84Packages.composer}/bin/composer "$@"
    '')
    (writeShellScriptBin "composer74" ''
      exec ${php83Packages.composer}/bin/composer "$@"
    '')
    
    # Database clients (not servers)
    dbeaver-bin
    
    # Utilities
    speedcrunch
    kdePackages.kdeconnect-kde
    
    # AI/ML tools
    ollama
    
    # Shell tools
    tmux
    atuin
  ];
}
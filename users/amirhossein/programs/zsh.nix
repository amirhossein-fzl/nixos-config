{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
    };
    autosuggestion = {
      enable = true;
      strategy = ["history" "completion"];
    };

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "laravel" "golang" ];
      theme = "af";
      custom = "$HOME/.oh-my-zsh";
    };

    initContent = ''
      export GOPROXY=https://goproxy.io,direct;
      export PATH="$HOME/.bin:$PATH"
      export PATH="$HOME/go/bin:$PATH"
      export PNPM_HOME="$HOME/.pnpm"
      case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
      esac
    '';

    shellAliases = {
      php = "php84";
      composer = "composer84";
    };
  };
}
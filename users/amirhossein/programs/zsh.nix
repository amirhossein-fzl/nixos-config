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

    history = {
      ignorePatterns = [
        "ls*"
        "cd*"
        "pwd"
        "clear"
        "exit"
        "history"
        "top"
        "htop"
        "jobs"
        "fg"
        "bg"
        "which*"
        "whereis"
        "env"
        "printenv"
        "git status"
      ];
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
{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    matchBlocks = {
      "ssh.falag.ir" = {
        hostname = "ssh.falag.ir";
        identityFile = "~/.ssh/girt/amirhossein-f";
        identitiesOnly = true;
      };
      "github.com" = {
        hostname = "github.com";
        identityFile = "~/.ssh/github/amirhossein-fzl";
        identitiesOnly = true;
      };
    };
  };
}

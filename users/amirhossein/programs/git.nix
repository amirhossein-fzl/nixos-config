{
  programs.git = {
    enable = true;
    extraConfig = {
      init.defaultBranch = "main";
      user = {
        name = "Amirhossein Fazli";
        email = "amirhossein95b@gmail.com";
      };
    };
  };
}
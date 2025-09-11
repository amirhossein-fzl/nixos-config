{
  programs = {
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    zsh = {
      enable = true;
    };

    nekoray = {
      enable = true;
      tunMode.enable = true;
    };

    virt-manager.enable = true;
  };
}

{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (import ../overlays/networkmanager-pptp.nix)
    ];
  };
}
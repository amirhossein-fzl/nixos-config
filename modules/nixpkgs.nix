{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (import ../overlays/networkmanager-pptp.nix)
      (import ../overlays/custom-packages.nix)
    ];
  };
}
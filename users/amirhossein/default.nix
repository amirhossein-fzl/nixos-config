{inputs, ...}:
{
  imports = [
    ./fonts.nix
    ./home.nix
    ./packages.nix
    inputs.zen-browser.homeModules.default
    ./programs
    ./services
  ];
}
{inputs, ...}:
{
  imports = [
    ./fonts.nix
    ./home.nix
    ../../modules/home-manager/zsh-you-should-use
    ./packages.nix
    inputs.zen-browser.homeModules.default
    ./programs
    ./services
  ];
}
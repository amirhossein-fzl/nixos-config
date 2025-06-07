{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix2111Pkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    nixpkgsStable.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix2111Pkgs, nixpkgsStable, home-manager, ... }@inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;

          # Alternative package sets for when you need specific versions
          nixpkgsStable = import nixpkgsStable {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };

          nix2111Pkgs = import nix2111Pkgs {
            system = "x86_64-linux";
            config.allowUnfree = true;
          };
        };
        modules = [
          ./nixos/configuration.nix
          ./modules/programs.nix
          ./modules/packages.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.amirhossein = import ./users/amirhossein.nix;
          }
        ];
      };
    };
  };
}

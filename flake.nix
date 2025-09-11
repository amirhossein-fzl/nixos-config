{
  description = "NixOS configuration flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix2111Pkgs.url = "github:NixOS/nixpkgs/nixos-21.11";
    nixpkgsStable.url = "github:NixOS/nixpkgs/nixos-25.05";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nix2111Pkgs, nixpkgsStable, home-manager, zen-browser, ... }@inputs: 
  let 
    system = "x86_64-linux";
    specialArgs = {
      inherit inputs;

      nixpkgsStable = import nixpkgsStable {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      nix2111Pkgs = import nix2111Pkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

      zen-browser = import zen-browser {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };

    };
  in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        inherit system specialArgs;
        modules = [
          ./nixos/configuration.nix
          ./modules/programs.nix
          ./modules/packages.nix

          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.amirhossein = import ./users/amirhossein;
            home-manager.extraSpecialArgs = specialArgs;
          }
        ];
      };
    };
  };
}

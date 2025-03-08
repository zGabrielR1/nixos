{
  description = "ZRRG's NixOS Configuration";

  inputs = {
    # Core dependencies
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hyprland
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-dots = {
      url = "github:JaKooLit/Hyprland-Dots/main";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations."nixos-laptop" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/nixos-laptop
          hyprland.nixosModules.default
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.zrrg = import ./home/zrrg;
            
            nix.settings = {
            	substituters = [
            		"https://cache.nixos.org/"
            		"https://zgabrielr.cachix.org"
            	];
            	trusted-public-keys = [
            		"zgabrielr.cachix.org-1:DNsXs3NCf3sVwby1O2EMD5Ai/uu1Z1uswKSh47A1mvw="
            	];
            };
          }
        ];
      };
    };
}

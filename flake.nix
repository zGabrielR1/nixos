
{
  description = "ZRRG's NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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
                "https://hyprland.cachix.org"
                "https://nix-community.cachix.org"
                "https://nixos.org/channels/nixos-unstable"
                "https://numtide.cachix.org"
                "https://divnix.cachix.org"
                "https://nixpkgs-wayland.cachix.org"
              ];
              trusted-public-keys = [
                "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                "zgabrielr.cachix.org-1:DNsXs3NCf3sVwby1O2EMD5Ai/uu1Z1uswKSh47A1mvw="
                "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiQMmr7/mho7G4ZPo="
                "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
                "nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
                "numtide.cachix.org-1:53/BlWLgjTTnOEGTBrOsbOWmA5BoTyJkj8eIG3mA0n8="
                "divnix.cachix.org-1:Ek/jazMWxT9v7i1I95Z6lfxyvMZgF3eLnMWajJ2KKZ0="
                "nixpkgs-wayland.cachix.org-1:XJ1a29PyPzUz8W6sEhnOTrF3OSa/6MExNdeyDOvGrmM="
              ];
              auto-optimise-store = true;
              trusted-users = [ "root" "@wheel" ];
            };
          }
        ];
      };
    };
}

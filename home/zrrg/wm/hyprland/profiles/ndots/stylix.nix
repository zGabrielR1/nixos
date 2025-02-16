{ config, pkgs, lib, ... }:

{
  stylix = {
    image = pkgs.fetchurl {
      url = "https://raw.githubusercontent.com/ndots/wallpapers/main/default.jpg";
      sha256 = "..."; # Add correct sha256
    };
    
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-dark.yaml";

    opacity = {
      terminal = 0.9;
      applications = 0.9;
      desktop = 0.9;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
} 
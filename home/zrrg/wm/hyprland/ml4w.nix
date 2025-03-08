{
  config,
  pkgs,
  lib,
  ...
}: {
  config = {
    # ML4W Hyprland-specific packages
    home.packages = with pkgs; [
      # Core Hyprland packages
      hyprland
      hyprpaper
      hyprlock
      hypridle
      hyprpicker

      # Fonts
      noto-fonts
      noto-fonts-emoji
      noto-fonts-cjk
      noto-fonts-extra

      # Wayland essentials
      xdg-desktop-portal-hyprland
      libnotify
      kitty
      qt5.qtwayland
      qt6.qtwayland

      # ML4W specific dependencies
      waybar
      rofi-wayland
      dunst
      nwg-dock-hyprland
      swaynotificationcenter
      fastfetch
      waypaper
      wlogout
    ];

    # ML4W Hyprland configuration
    xdg.configFile = {
      "hypr/hyprland.conf".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/dotfiles/.config/hypr/hyprland.conf";
      "waybar".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/dotfiles/.config/waybar";
      "dunst".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/dotfiles/.config/dunst";
      "rofi".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/dotfiles/.config/rofi";
      "kitty".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/dotfiles/.config/kitty";
      "nwg-dock-hyprland".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/dotfiles/.config/nwg-dock-hyprland";
      "swaync".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/dotfiles/.config/swaync";
      "wlogout".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/dotfiles/.config/wlogout";
      "waypaper".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/dotfiles/.config/waypaper";
    };

    # Additional ML4W specific settings
    home.file = {
      ".local/share/ml4w-dotfiles".source = config.lib.file.mkOutOfStoreSymlink 
        "${config.home.homeDirectory}/.local/share/ml4w-dotfiles";
      ".local/share/fonts" = {
        source = "${config.home.homeDirectory}/.local/share/ml4w-dotfiles/share/fonts";
        recursive = true;
      };
    };
  };
}

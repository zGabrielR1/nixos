{
  config,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./niri
    ./hyprland
    ./awesome
  ];

  config = {
    # Common window manager dependencies and configurations
    home.packages = with pkgs; [
      # Core utilities
      xorg.xrandr
      xorg.xrdb
      xorg.setxkbmap
      xorg.xmodmap
      xorg.xset
      
      # Window management utilities
      wmctrl
      xdotool
      
      # System tray and status
      networkmanagerapplet
      pasystray
      
      # Clipboard management
      wl-clipboard
      xclip
      
      # Screenshot and screen recording
      grim
      slurp
      
      # System monitoring
      btop
      htop
      
      # File management
      xdg-utils
      
      # Theme and appearance
      qt5ct
      qt6ct
      gtk3
      gtk4
      
      # Audio control
      pamixer
      playerctl
      pavucontrol
      
      # Common applications
      alacritty
      rofi
      dunst
    ];

    # Common XDG portal configuration
    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };

    # Common environment variables
    home.sessionVariables = {
      # XDG specifications
      XDG_CURRENT_DESKTOP = "Hyprland";
      XDG_SESSION_TYPE = "wayland";
      
      # Qt/GTK settings
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_QPA_PLATFORMTHEME = "qt6ct";
      QT_SCALE_FACTOR = "1";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      
      # Wayland-specific
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      SDL_VIDEODRIVER = "wayland";
      _JAVA_AWT_WM_NONREPARENTING = "1";
      
      # Default applications
      TERMINAL = "alacritty";
      EDITOR = "nvim";
    };
  };
}

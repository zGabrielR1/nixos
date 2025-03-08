# home/zrrg/wm/hyprland/default.nix
{ config, pkgs, lib, ... }:

let
  # Profile selection (change this to switch profiles)
  selectedProfile = "jakoolit"; # Options: jakoolit, dotfiles, personal, ml4w

  jakoolit-dots = pkgs.fetchFromGitHub {
    owner = "JaKooLit";
    repo = "Hyprland-Dots";
    rev = "main";
    sha256 = lib.fakeSha256; # You'll need to replace this with the actual hash after first attempt
  };

  # Common packages required by all profiles
  commonPackages = with pkgs; [
    waybar
    rofi
    wofi
    dunst
    kitty
    swww
    cava
    btop
    fastfetch
    swappy
    wlogout
    qt5ct
    qt6ct
    wl-clipboard
    xdg-utils
    polkit_gnome
    networkmanagerapplet
    pavucontrol
  ];

  # Profile-specific configurations
  profileConfigs = {
    jakoolit = {
      # Original JaKooLit configuration
      home.file = {
        ".config/hypr".source = "${jakoolit-dots}/config/hypr";
        ".config/waybar".source = "${jakoolit-dots}/config/waybar";
        ".config/rofi".source = "${jakoolit-dots}/config/rofi";
        ".config/dunst".source = "${jakoolit-dots}/config/dunst";
        ".config/kitty".source = "${jakoolit-dots}/config/kitty";
        ".config/cava".source = "${jakoolit-dots}/config/cava";
        ".config/btop".source = "${jakoolit-dots}/config/btop";
        ".config/fastfetch".source = "${jakoolit-dots}/config/fastfetch";
        ".config/swappy".source = "${jakoolit-dots}/config/swappy";
        ".config/wlogout".source = "${jakoolit-dots}/config/wlogout";
        ".config/qt5ct".source = "${jakoolit-dots}/config/qt5ct";
        ".config/qt6ct".source = "${jakoolit-dots}/config/qt6ct";
      };
    };
    dotfiles = {
      imports = [ ./profiles/dotfiles ];
    };
    personal = {
      imports = [ ./profiles/personal ];
    };
    ml4w = {
      imports = [ ./ml4w.nix ];
    };
    ndots = {
      imports = [ ./profiles/ndots ];
    };
  };

in {
  imports = (profileConfigs.${selectedProfile}.imports or []) ++ (if selectedProfile == "jakoolit" then [] else []);

  config = lib.mkMerge [
    {
      # Common configuration for all profiles
      home.packages = commonPackages;

      wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;
      };

      # Add necessary environment variables
      home.sessionVariables = {
        CLUTTER_BACKEND = "wayland";
        GDK_BACKEND = "wayland,x11";
        QT_AUTO_SCREEN_SCALE_FACTOR = "1";
        QT_QPA_PLATFORM = "wayland;xcb";
        QT_QPA_PLATFORMTHEME = "qt6ct";
        QT_SCALE_FACTOR = "1";
        QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
        XDG_CURRENT_DESKTOP = "Hyprland";
        XDG_SESSION_DESKTOP = "Hyprland";
        XDG_SESSION_TYPE = "wayland";
        MOZ_ENABLE_WAYLAND = "1";
        ELECTRON_OZONE_PLATFORM_HINT = "auto";
        NIXOS_OZONE_WL = "1";
      };
    }
    (profileConfigs.${selectedProfile} or { })
  ];
}

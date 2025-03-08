{
  config,
  pkgs,
  lib,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      monitor = [
        ", preferred, auto, auto"
      ];

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";
        resize_on_border = true;
        allow_tearing = false;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 1.0;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };

        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = true;
          ignore_opacity = false;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "myBezier, 0.05, 0.9, 0.1, 1.05"
        ];
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          drag_lock = true;
        };
        sensitivity = 0;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      exec-once = [
        "waybar"
        "hyprpaper"
        "nm-applet"
        "systemctl --user start hyprpolkitagent"
        "swaync"
        "hypridle"
      ];

      bind = [
        "SUPER, Return, exec, kitty"
        "SUPER, Q, killactive,"
        "SUPER SHIFT, Q, exit,"
        "SUPER, Space, togglefloating,"
        "SUPER, D, exec, rofi -no-lazy-grab -show drun"
        "SUPER, E, exec, nautilus"
        
        # Move focus
        "SUPER, left, movefocus, l"
        "SUPER, right, movefocus, r"
        "SUPER, up, movefocus, u"
        "SUPER, down, movefocus, d"
        
        # Move windows
        "SUPER SHIFT, left, movewindow, l"
        "SUPER SHIFT, right, movewindow, r"
        "SUPER SHIFT, up, movewindow, u"
        "SUPER SHIFT, down, movewindow, d"
        
        # Switch workspaces
        "SUPER, 1, workspace, 1"
        "SUPER, 2, workspace, 2"
        "SUPER, 3, workspace, 3"
        "SUPER, 4, workspace, 4"
        "SUPER, 5, workspace, 5"
        "SUPER, 6, workspace, 6"
        
        # Move active window to workspace
        "SUPER SHIFT, 1, movetoworkspace, 1"
        "SUPER SHIFT, 2, movetoworkspace, 2"
        "SUPER SHIFT, 3, movetoworkspace, 3"
        "SUPER SHIFT, 4, movetoworkspace, 4"
        "SUPER SHIFT, 5, movetoworkspace, 5"
        "SUPER SHIFT, 6, movetoworkspace, 6"
      ];

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];
    };
  };

  # Required packages for this profile
  home.packages = with pkgs; [
    overskride
    networkmanagerapplet
    wdisplays
    nautilus
    pavucontrol
    wl-clipboard
    file-roller
    hyprpaper
    hyprpolkitagent
    waypaper
    hyprshot
    kitty
    rofi
    waybar
    swaync
    hypridle
  ];

  # Common environment variables
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    HYPRSHOT_DIR = "/home/zrrg/Pictures/Screenshots";
  };

  # XDG portal configuration
  xdg.portal = {
    enable = true;
    config.common.default = "*";
    xdgOpenUsePortal = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}

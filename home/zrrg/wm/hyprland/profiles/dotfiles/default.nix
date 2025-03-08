{
  config,
  pkgs,
  lib,
  ...
}: let
  blurrule = "opacity 0.9 override 0.9 override 1.0 override";
in {
  wayland.windowManager.hyprland = {
    systemd.enable = false;
    settings = {
      experimental.xx_color_management_v4 = true;

      cursor = {
        warp_back_after_non_mouse_input = true;
      };

      env = [
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "XCURSOR_THEME,Adwaita"
        "XCURSOR_SIZE,24"
      ];

      exec-once = [
        "dbus-update-activation-environment --systemd --all"
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "waybar"
        "dunst"
      ];

      exec = [
        "hyprpaper"
      ];

      monitor = [
        ", preferred, auto, 1"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
        };
      };
                      
      gestures = {
        workspace_swipe = true;
        workspace_swipe_cancel_ratio = 0.01;
        workspace_swipe_fingers = 3;
      };

      workspace = [
        "1, persistent:true"
        "2, persistent:true"
        "3, persistent:true"
        "4, persistent:true"
        "5, persistent:true"
        "6, persistent:true"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "rgb(d65d0e) rgb(fe8019) rgb(ebdbb2) rgb(83a598) rgb(458588) 45deg";
        "col.inactive_border" = "rgb(3c3836)";
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      decoration = {
        rounding = 8;

        shadow = {
          enabled = true;
          color = "rgba(32,32,32,1)";
          ignore_window = false;
          offset = "0, 0";
          range = 8;
          render_power = 2;
          scale = 1;
        };

        blur = {
          enabled = true;
          size = 4;
          passes = 3;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "ease, 0.25, 0.1, 0.25, 1"
          "easeCirc, 0.85, 0, 0.15, 1"
          "easeIn, 0.42, 0, 1, 1"
        ];

        animation = [
          "windows, 1, 4, ease, slide"
          "windowsOut, 1, 4, ease, slide"
          "border, 1, 10, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, easeCirc"
        ];
      };

      bind = [
        "SUPER, Return, exec, alacritty"
        "SUPER, Q, killactive,"
        "SUPER SHIFT, Q, exit,"
        "SUPER, Space, togglefloating,"
        "SUPER, D, exec, rofi -show drun"
        "SUPER, P, pseudo,"
        "SUPER, J, togglesplit,"
        
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
        "SUPER,mouse:272,movewindow"
        "SUPER,mouse:273,resizewindow"
      ];
    };
  };

  # Required packages for this profile
  home.packages = with pkgs; [
    waybar
    rofi
    dunst
    alacritty
    hyprpaper
    polkit_gnome
  ];
}

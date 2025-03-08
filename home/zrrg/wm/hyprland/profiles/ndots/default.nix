{ config, pkgs, lib, ... }:

{
  imports = [
    # Import all the home-manager related configs from ndots
    ./stylix.nix     # Stylix theming
    ./shell.nix      # Shell configurations
    ./utils.nix      # Utilities
    ./programs.nix   # Various programs
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    settings = {
      "$mod" = "SUPER";

      binds = {
        allow_workspace_cycles = false;
        focus_preferred_method = 1;
        workspace_center_on = 1;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        use_active_for_splits = true;
      };

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        float_switch_override_focus = 1;
        mouse_refocus = true;
        repeat_rate = 50;
        repeat_delay = 300;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          clickfinger_behavior = true;
        };

        sensitivity = 0.6;
      };

      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
          ignore_opacity = true;
          xray = false;
          popups = true;
        };
      };

      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "linear, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, popin"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "fade, 1, 10, default"
          "workspaces, 1, 5, wind"
        ];
      };

      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        disable_autoreload = true;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        focus_on_activate = true;
        allow_session_lock_restore = true;
      };
    };
  };

  home.packages = with pkgs; [
    waybar
    rofi
    dunst
    kitty
    swww
    wl-clipboard
    xdg-utils
    polkit_gnome
    networkmanagerapplet
    pavucontrol
  ];
} 
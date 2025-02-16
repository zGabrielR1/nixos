{
  config,
  pkgs,
  lib,
  ...
}: let
  pointer = config.home.pointerCursor;
  makeCommand = command: {
    command = [command];
  };
in {
  programs.niri.settings = {
    environment = {
      CLUTTER_BACKEND = "wayland";
      DISPLAY = ":0";
      GDK_BACKEND = "wayland,x11";
      MOZ_ENABLE_WAYLAND = "1";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
      SDL_VIDEODRIVER = "wayland";
    };

    spawn-at-startup = [
      (makeCommand "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1")
      (makeCommand "swaylock")
      (makeCommand "wl-paste --type image --watch cliphist store")
      (makeCommand "wl-paste --type text --watch cliphist store")
    ];

    input = {
      keyboard.xkb.layout = "latam";
      touchpad = {
        click-method = "button-areas";
        dwt = true;
        dwtp = true;
        natural-scroll = true;
        scroll-method = "two-finger";
        tap = true;
        tap-button-map = "left-right-middle";
        accel-profile = "adaptive";
      };
      focus-follows-mouse.enable = true;
      warp-mouse-to-focus = true;
      workspace-auto-back-and-forth = true;
    };

    outputs = {
      "eDP-1" = {
        scale = 1.0;
        position = {
          x = 0;
          y = 0;
        };
      };
    };

    cursor = {
      size = 20;
      theme = "${pointer.name}";
    };

    layout = {
      focus-ring.enable = false;
      border = {
        enable = true;
        width = 1;
        active.color = "#16aff1";
        inactive.color = "#245b89";
      };

      preset-column-widths = [
        {proportion = 1.0 / 3.0;}
        {proportion = 1.0 / 2.0;}
        {proportion = 2.0 / 3.0;}
        {proportion = 1.0;}
      ];
      default-column-width = {proportion = 1.0 / 2.0;};

      gaps = 8;
      struts = {
        left = 0;
        right = 0;
        top = 0;
        bottom = 0;
      };
    };
  };
}

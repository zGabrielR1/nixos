{
  config,
  pkgs,
  lib,
  ...
}: {
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome;
    luaModules = with pkgs.luaPackages; [
      luarocks
      lgi
      ldbus
      luadbi-mysql
      luaposix
    ];
  };

  # Required packages for the AwesomeWM configuration
  home.packages = with pkgs; [
    # Core utilities
    picom
    nitrogen
    rofi
    dunst
    alacritty
    polybar
    
    # System utilities
    brightnessctl
    pamixer
    playerctl
    
    # Additional tools
    maim
    xclip
    xdotool
    wmctrl
    
    # Development tools
    lua
    luarocks
  ];

  # Copy the AwesomeWM configuration files
  home.file = {
    ".config/awesome" = {
      source = ./config;
      recursive = true;
    };
    ".config/awesome/themes" = {
      source = ./themes;
      recursive = true;
    };
  };

  # Environment variables
  home.sessionVariables = {
    AWESOME_THEME = "default";
    TERMINAL = "alacritty";
  };
}

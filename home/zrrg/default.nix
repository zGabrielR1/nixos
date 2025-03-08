# This is your home-manager configuration file
{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "zrrg";
  home.homeDirectory = "/home/zrrg";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Allow unfree packages


  # Basic packages that should be installed
  home.packages = with pkgs; [
    # Add your packages here
    git
    neovim
    htop
    firefox
    code-cursor
    windsurf
    caligula
  ];

  # Programs configurations
  programs = {
    bash = {
      enable = true;
      enableCompletion = true;
    };

    git = {
      enable = true;
      userName = "zrrg";
      userEmail = ""; # Add your email here
    };
  };

  # Additional configurations can be added here
}

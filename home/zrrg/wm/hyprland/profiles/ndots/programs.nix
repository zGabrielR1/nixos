{ config, pkgs, lib, ... }:

{
  programs = {
    # Terminal
    alacritty = {
      enable = true;
      settings = {
        window.opacity = 0.9;
        font = {
          normal.family = "JetBrainsMono Nerd Font";
          size = 12;
        };
      };
    };

    # Development
    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;
    };

    # Git configuration
    git = {
      enable = true;
      userName = "Your Name";
      userEmail = "your.email@example.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };

    # Additional programs from ndots
  };
} 
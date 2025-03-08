{ config, pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    # System utilities
    btop
    htop
    neofetch
    ripgrep
    fd
    fzf
    jq
    tree
    unzip
    wget
    
    # Development tools
    git
    gh
    lazygit
    
    # Media utilities
    ffmpeg
    imagemagick
    
    # Other utilities from ndots
  ];
} 
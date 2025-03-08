#!/usr/bin/env bash

# Set up ML4W dotfiles as a Git submodule
setup_ml4w() {
    local ML4W_DIR="$HOME/.local/share/ml4w-dotfiles"
    
    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$ML4W_DIR")"
    
    # Check if ML4W dotfiles directory already exists
    if [ -d "$ML4W_DIR" ]; then
        echo "ML4W dotfiles directory already exists at $ML4W_DIR"
        echo "Updating existing installation..."
        cd "$ML4W_DIR" || exit 1
        git pull origin main
    else
        echo "Cloning ML4W dotfiles..."
        git clone https://github.com/mylinuxforwork/dotfiles.git "$ML4W_DIR"
    fi
    
    # Create necessary symlinks
    echo "Setting up configuration symlinks..."
    mkdir -p "$HOME/.config"
    
    # Link ML4W configuration files
    configs=(
        "hypr"
        "waybar"
        "dunst"
        "rofi"
        "kitty"
        "nwg-dock-hyprland"
        "swaync"
        "wlogout"
        "waypaper"
    )
    
    for config in "${configs[@]}"; do
        if [ -d "$HOME/.config/$config" ]; then
            echo "Backing up existing $config configuration..."
            mv "$HOME/.config/$config" "$HOME/.config/$config.bak.$(date +%Y%m%d%H%M%S)"
        fi
        ln -sf "$ML4W_DIR/share/dotfiles/.config/$config" "$HOME/.config/$config"
    done
    
    # Link fonts
    echo "Setting up fonts..."
    mkdir -p "$HOME/.local/share/fonts"
    cp -r "$ML4W_DIR/share/fonts/"* "$HOME/.local/share/fonts/"
    fc-cache -f
    
    echo "ML4W setup complete!"
    echo "To use the ML4W configuration, edit your home/zrrg/wm/hyprland/default.nix"
    echo "and set selectedProfile = \"ml4w\";"
}

# Run the setup
setup_ml4w

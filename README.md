# nixos-dots

NixOS configuration files with multiple Hyprland configurations, including ML4W integration.

## Available Hyprland Configurations

- **JaKooLit**: The default configuration based on JaKooLit's Hyprland dots
- **ML4W**: Material Linux For Work Hyprland configuration with modern design and workflow optimizations
- **Personal**: Custom personal configuration

## ML4W Integration

The ML4W (Material Linux For Work) configuration provides a modern and polished Hyprland experience. To use the ML4W configuration:

1. Run the setup script to install ML4W dotfiles:
```bash
./scripts/setup-ml4w.sh
```

2. Switch to the ML4W profile by editing `home/zrrg/wm/hyprland/default.nix`:
```nix
# Change the selectedProfile to "ml4w"
selectedProfile = "ml4w";
```

3. Rebuild your NixOS configuration:
```bash
sudo nixos-rebuild switch
```

The ML4W configuration includes:
- Modern Waybar theme with ML4W styling
- Optimized Hyprland configuration
- Nwg-dock integration
- Custom keybindings and gestures
- Pre-configured applications (Kitty, Rofi, Dunst, etc.)
- Beautiful wallpapers and themes

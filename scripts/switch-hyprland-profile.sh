#!/usr/bin/env bash

# Script to switch between Hyprland profiles

HYPRLAND_CONFIG="/home/zrrg-3/Downloads/merge/ml4w/nixos-dots/home/zrrg/wm/hyprland/default.nix"

# Available profiles
PROFILES=("jakoolit" "ml4w" "personal" "ndots")

# Function to show usage
usage() {
    echo "Usage: $0 <profile>"
    echo "Available profiles:"
    for profile in "${PROFILES[@]}"; do
        echo "  - $profile"
    done
    exit 1
}

# Check if profile argument is provided
if [ $# -ne 1 ]; then
    usage
fi

PROFILE="$1"

# Validate profile
if [[ ! " ${PROFILES[@]} " =~ " ${PROFILE} " ]]; then
    echo "Error: Invalid profile '$PROFILE'"
    usage
fi

# Backup current configuration
backup_file="$HYPRLAND_CONFIG.bak.$(date +%Y%m%d%H%M%S)"
cp "$HYPRLAND_CONFIG" "$backup_file"
echo "Backed up current configuration to $backup_file"

# Update profile in configuration
sed -i "s/selectedProfile = \"[^\"]*\"/selectedProfile = \"$PROFILE\"/" "$HYPRLAND_CONFIG"

echo "Switched to $PROFILE profile"
echo "Please rebuild your configuration with: sudo nixos-rebuild switch"

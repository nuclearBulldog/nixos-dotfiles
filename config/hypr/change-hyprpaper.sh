#!/usr/bin/env bash

# Set the directory where your wallpapers are stored
WALLPAPER_DIR="$HOME/nixos-dotfiles/wallpapers/"

# Get a random wallpaper from the directory
# The ! -name "$(basename \"$CURRENT_WALL\")" part is for single monitor setups,
CURRENT_WALL=$(hyprctl hyprpaper listloaded)
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Set the wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"

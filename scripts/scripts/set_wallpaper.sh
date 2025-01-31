#!/bin/bash

# Path to the hyprlock and hyprpaper config files
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"
CURRENT_WALLPAPER="$HOME/.config/hypr/current_wallpaper.txt"

# Get the selected image file as an argument
WALLPAPER="$1"

# Check if the file exists and is an image
if [[ -f "$WALLPAPER" && "$WALLPAPER" =~ \.(jpg|jpeg|png|bmp|gif)$ ]]; then
    # Check if hyprpaper is running, if not, start it
    # Save the current wallpaper path
    echo "$WALLPAPER" > "$CURRENT_WALLPAPER"

    # Update hyprlock.conf with the new wallpaper path
    sed -i "s|path = .*|path = $WALLPAPER|" "$HYPRLOCK_CONF"


    # Set the wallpaper using hyprpaper
    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"

    # Cleanup unused wallpapers
    sleep 1
    hyprctl hyprpaper unload unused

    echo "Wallpaper set to: $WALLPAPER"
else
    echo "Error: Please provide a valid image file."
    exit 1
fi

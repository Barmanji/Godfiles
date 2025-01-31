#!/bin/bash

WALLPAPER_DIRECTORY=/home/barmanji/Downloads/ColorWall
WALLPAPER=$(find "$WALLPAPER_DIRECTORY" -type f | shuf -n 1)

# Save the current wallpaper path
echo "$WALLPAPER" > ~/.config/hypr/current_wallpaper.txt
# Update hyprlock.conf with the new wallpaper path
sed -i "s|path = .*|path = $WALLPAPER|" ~/.config/hypr/hyprlock.conf

# Check if hyprpaper is running
if ! pgrep -x "hyprpaper" > /dev/null; then
    echo "hyprpaper is not running. Restarting hyprpaper..."
    # Restart hyprpaper
    hyprpaper & disown
    # Wait a moment to ensure hyprpaper starts
    sleep 2
fi

# Set the wallpaper
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"

# Unload unused wallpapers
sleep 1
hyprctl hyprpaper unload unused

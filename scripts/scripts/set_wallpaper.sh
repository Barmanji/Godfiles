#!/bin/bash

# Path to the hyprlock config file
HYPRLOCK_CONF="$HOME/.config/hypr/hyprlock.conf"
CURRENT_WALLPAPER="$HOME/.config/hypr/current_wallpaper.txt"

# Get the selected image file as an argument
WALLPAPER="$1"

# Check if the file exists and is an image
if [[ -f "$WALLPAPER" && "$WALLPAPER" =~ \.(jpg|jpeg|png|bmp|gif|webp|tiff)$ ]]; then
    # Start swww-daemon if not running
    if ! pgrep -x "swww-daemon" > /dev/null; then
        swww-daemon &
        sleep 1
    fi

    # Save the current wallpaper path
    echo "$WALLPAPER" > "$CURRENT_WALLPAPER"

    # Update hyprlock.conf with the new wallpaper path
    sed -i "s|path = .*|path = $WALLPAPER|" "$HYPRLOCK_CONF"

    # Set the wallpaper using swww
    swww img "$WALLPAPER" --transition-type wave --transition-step 100 --transition-duration 1 --transition-fps 255

    echo "Wallpaper set to: $WALLPAPER"
else
    echo "Error: Please provide a valid image file."
    exit 1
fi

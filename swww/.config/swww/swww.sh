#!/usr/bin/bash

# Wallpaper directory
WALLPAPERS_DIR="/home/barmanji/Downloads/ColorWall/"

# Hyprlock config file
HYPRLOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"

# Change interval (15 minutes)
INTERVAL=$((60*60))  # 15 min in seconds

# Start swww-daemon if not already running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon &
    sleep 1  # Give it a moment to start
fi

while true; do
    # Select a random wallpaper with valid extensions
    WALLPAPER=$(find "$WALLPAPERS_DIR" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.bmp" -o -iname "*.tiff" -o -iname "*.webp" \) | shuf -n 1)

    # Apply wallpaper if found
    if [[ -n "$WALLPAPER" ]]; then
        echo "$WALLPAPER" > "$HOME/.current_wallpaper"  # Save the wallpaper path

        # Apply wallpaper with swww
        swww img "$WALLPAPER" --transition-type wave --transition-step 100 --transition-duration 1 --transition-fps 255

        # Update Hyprlock config with new wallpaper path (only in the background section)
        sed -i "/background {/,/}/s|path = .*|path = $WALLPAPER|" "$HYPRLOCK_CONFIG"

        # Reload Hyprlock to apply the new wallpaper
        pkill -USR1 hyprlock 2>/dev/null
    else
        echo "No valid wallpapers found in $WALLPAPERS_DIR"
    fi

    sleep "$INTERVAL"  # Wait before changing again
done



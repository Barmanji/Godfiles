#!/bin/bash

notif="$HOME/.config/swaync/images/bell.png"

default_gaps_out_everywhere=7
default_gaps_out_with_waybar=0,7,7,7

STATE=$(pgrep -x waybar >/dev/null && echo "Waybar is running" || echo "Waybar is not running")

if [ "${STATE}" == "Waybar is running" ]; then
    hyprctl keyword general:gaps_out $default_gaps_out_everywhere
    pkill waybar
    notify-send -e -u critical -i "$notif" "Zen Mode Enabled"
else
    waybar & disown
    hyprctl keyword general:gaps_out $default_gaps_out_with_waybar
    notify-send -e -u critical -i "$notif" "Zen Mode Disabled"
fi

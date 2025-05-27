#!/usr/bin/env bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for changing blurs on the fly

notif="$HOME/.config/swaync/images/bell.png"

STATE=$(hyprctl -j getoption decoration:blur:enabled | jq ".int")

if [ "${STATE}" == "0" ]; then
    hyprctl keyword decoration:blur:enabled true
    notify-send -e -u critical -i "$notif" "Blur"
else
    hyprctl keyword decoration:blur:enabled false
    notify-send -e -u critical -i "$notif" "Transparent"
fi

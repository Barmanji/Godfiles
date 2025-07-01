#!/bin/bash


notif="$HOME/.config/swaync/images/bell.png"

STATE=$(hyprctl -j getoption general:gaps_in | jq -r '.custom | split(" ")[0] | tonumber')

default_gaps_in=3
default_gaps_out=0,7,7,7
default_rounding=7

if [ "${STATE}" == "3" ]; then
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword decoration:rounding 0
 	notify-send -e -u critical -i "$notif" "Gaps & Rounding disabled"
else
    hyprctl keyword general:gaps_in $default_gaps_in
    hyprctl keyword general:gaps_out $default_gaps_out
    hyprctl keyword decoration:rounding $default_rounding
    notify-send -e -u critical -i "$notif" "Gaps & Rounding enabled"
fi

#!/usr/bin/env bash

notif="$HOME/.config/swaync/images/bell.png"
currTime=$(date +%-H)

if [[ "$currTime" -ge 4 ]] && [[ "$currTime" -le 20 ]]; then
    hyprctl hyprsunset gamma 100
    hyprctl hyprsunset temperature 6000
    notify-send -e -u critical -i "$notif" "NightLight Off"
else
    hyprctl hyprsunset temperature 4500
    hyprctl hyprsunset gamma 90
    notify-send -e -u critical -i "$notif" "NightLight On"
fi



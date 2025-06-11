#!/usr/bin/env bash
# export DISPLAY=:0
# PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/bin
#
# export WAYLAND_DISPLAY="wayland-1"
# export XDG_RUNTIME_DIR="/run/user/$(id -u)"

notif="$HOME/.config/swaync/images/bell.png"
currTime=$(date +%H)

if [[ "$currTime" -ge 4 ]] && [[ "$currTime" -le 21 ]]; then
    echo "hi"
    hyprctl hyprsunset gamma 100
    hyprctl hyprsunset temperature 6000
    notify-send -e -u critical -i "$notif" "NightLight Off"
else
    hyprctl hyprsunset temperature 5000
    hyprctl hyprsunset gamma 90
    notify-send -e -u critical -i "$notif" "NightLight On"
fi



#!/usr/bin/env bash
# export DISPLAY=:0
# PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/bin
#
# export WAYLAND_DISPLAY="wayland-1"
# export XDG_RUNTIME_DIR="/run/user/$(id -u)"

currTime=$(date +%H)

if [[ "$currTime" -ge 4 ]] || [[ "$currTime" -le 21 ]]; then
    echo "Hi"
    hyprctl hyprsunset gamma 100
    hyprctl hyprsunset temperature 6000
else
    hyprctl hyprsunset temperature 5500
    hyprctl hyprsunset gamma 97
fi



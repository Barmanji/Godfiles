#!/bin/bash

notif="$HOME/.config/swaync/images/bell.png"
currTime=$(LANG=C date +%-H)

hyprlandSession=$(grep HYPRLAND_INSTANCE_SIGNATURE $HOME/.config/hypr/.hypr_env | cut -d= -f2)
export PATH=/home/barmanji/.local/share/pnpm:/home/barmanji/.local/share/zinit/polaris/bin:/home/barmanji/.cargo/bin:/usr/local/bin:/usr/bin
export WAYLAND_DISPLAY="wayland-1"
export XDG_RUNTIME_DIR="/run/user/1000"
export HYPRLAND_INSTANCE_SIGNATURE="$hyprlandSession"

if [[ "$currTime" -ge 4 ]] && [[ "$currTime" -lt 20 ]]; then
    hyprctl hyprsunset gamma 100
    hyprctl hyprsunset temperature 6000
else
    hyprctl hyprsunset temperature 3800
    hyprctl hyprsunset gamma 85
fi





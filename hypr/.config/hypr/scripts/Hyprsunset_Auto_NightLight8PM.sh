#!/bin/bash

notif="$HOME/.config/swaync/images/bell.png"

hyprlandSession=$(grep HYPRLAND_INSTANCE_SIGNATURE $HOME/.config/hypr/.hypr_env | cut -d= -f2)
export PATH=/home/barmanji/.local/share/pnpm:/home/barmanji/.local/share/zinit/polaris/bin:/home/barmanji/.cargo/bin:/usr/local/bin:/usr/bin
export WAYLAND_DISPLAY="wayland-1"
export XDG_RUNTIME_DIR="/run/user/1000"
export HYPRLAND_INSTANCE_SIGNATURE="$hyprlandSession"

hyprctl hyprsunset temperature 4500
hyprctl hyprsunset gamma 90
notify-send -e -u critical -i "$notif" "NightLight On"



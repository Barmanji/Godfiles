#!/bin/bash
hyprlandSession="$HYPRLAND_INSTANCE_SIGNATURE"
export PATH=/home/barmanji/.local/share/pnpm:/home/barmanji/.local/share/zinit/polaris/bin:/home/barmanji/.cargo/bin:/usr/local/bin:/usr/bin
export WAYLAND_DISPLAY="wayland-1"
export XDG_RUNTIME_DIR="/run/user/1000"
export HYPRLAND_INSTANCE_SIGNATURE="$hyprlandSession"

 hyprctl hyprsunset temperature 3000

#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Script for changing blurs on the fly

notif="$HOME/.config/swaync/images/bell.png"

STATE=$(hyprctl -j getoption decoration:blur:passes | jq ".int")

if [ "${STATE}" == "0" ]; then
	hyprctl keyword decoration:blur:size 4
	hyprctl keyword decoration:blur:passes 4
 	notify-send -e -u critical -i "$notif" "Blur"
else
	hyprctl keyword decoration:blur:size 0
	hyprctl keyword decoration:blur:passes 0
  	notify-send -e -u critical -i "$notif" "Transparent"
fi

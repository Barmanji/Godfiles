#!/usr/bin/env bash
hyprctl dispatch exec "google-chrome-stable" && sleep 3 && hyprctl dispatch movetoworkspacesilent 9,class:google-chrome

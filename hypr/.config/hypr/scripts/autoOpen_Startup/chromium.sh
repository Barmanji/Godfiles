#!/usr/bin/env bash
hyprctl dispatch exec "chromium" && sleep 3 && hyprctl dispatch movetoworkspacesilent 9,class:chromium

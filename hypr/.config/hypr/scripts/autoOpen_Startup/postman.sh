#!/usr/bin/env bash

hyprctl dispatch exec postman && sleep 2 && hyprctl dispatch movetoworkspacesilent 1,class:Postman



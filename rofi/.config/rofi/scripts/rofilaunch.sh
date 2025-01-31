#!/usr/bin/env sh

# Set default mode to 'drun'
r_mode="drun"

# Check the input argument for mode
case "${1}" in
    d|--drun) r_mode="drun" ;;              # Application launcher
    k|--keys) r_mode="keys" ;;          # Window switcher
    f|--filebrowser) r_mode="filebrowser" ;; # File explorer
    r|--recursivebrowser) r_mode="recursivebrowser" ;; # Recursive file browser
    *) r_mode="drun" ;;                      # Default to 'drun' if no valid option is passed
esac

# Launch rofi with the selected mode
rofi -show "${r_mode}"

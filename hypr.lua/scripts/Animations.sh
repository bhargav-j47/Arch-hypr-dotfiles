#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# For applying Animations from different users

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

# Variables
iDIR="$HOME/.config/swaync/images"
SCRIPTSDIR="$HOME/.config/hypr/scripts"
animations_dir="$HOME/.config/hypr/animations"
UserConfigs="$HOME/.config/hypr/UserConfigs"

# list of animation files, sorted alphabetically with numbers first
animations_list=$(find "$animations_dir" -maxdepth 1 -type f \( -name "*.lua" -o -name "*.conf" \) | sed 's/.*\///' | sed 's/\.lua$//' | sed 's/\.conf$//' | sort -u -V)

# Rofi Menu
chosen_file=$(echo "$animations_list" | rofi -i -dmenu -config ~/.config/rofi/config-Animations.rasi)

# Check if a file was selected
if [[ -n "$chosen_file" ]]; then
    # Copy both .lua and .conf if present to ensure compatibility
    if [[ -f "$animations_dir/$chosen_file.lua" ]]; then
        cp "$animations_dir/$chosen_file.lua" "$UserConfigs/UserAnimations.lua"
    fi
    if [[ -f "$animations_dir/$chosen_file.conf" ]]; then
        cp "$animations_dir/$chosen_file.conf" "$UserConfigs/UserAnimations.conf"
    fi
    
    notify-send -u low -i "$iDIR/ja.png" "$chosen_file" "Hyprland Animation Loaded"
else
    notify-send -u low -i "$iDIR/ja.png" "You chose NOT" "to apply other Hyprland animations"
fi

sleep 1
"$SCRIPTSDIR/RefreshNoWaybar.sh"

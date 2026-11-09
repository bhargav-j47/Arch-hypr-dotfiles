#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Searchable enabled keybinds using rofi

# Kill yad to not interfere with this binds
pkill yad || true

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

# Define the config files
KEYBINDS_CONF="$HOME/.config/hypr/configs/Keybinds.conf"
USER_KEYBINDS_CONF="$HOME/.config/hypr/UserConfigs/UserKeybinds.conf"
LAPTOP_CONF="$HOME/.config/hypr/UserConfigs/Laptops.conf"

KEYBINDS_LUA="$HOME/.config/hypr/configs/Keybinds.lua"
USER_KEYBINDS_LUA="$HOME/.config/hypr/UserConfigs/UserKeybinds.lua"
LAPTOP_LUA="$HOME/.config/hypr/UserConfigs/Laptops.lua"

# Combine the contents of the keybinds files and filter for keybinds
files_to_read=()
for f in "$KEYBINDS_LUA" "$USER_KEYBINDS_LUA" "$LAPTOP_LUA" "$KEYBINDS_CONF" "$USER_KEYBINDS_CONF" "$LAPTOP_CONF"; do
    [[ -f "$f" ]] && files_to_read+=("$f")
done

KEYBINDS=$(cat "${files_to_read[@]}" 2>/dev/null | grep -E '^(bind|bindl|binde|bindm|hl\.bind)')

# check for any keybinds to display
if [[ -z "$KEYBINDS" ]]; then
    echo "No keybinds found."
    exit 1
fi

# Use rofi to display the keybinds
echo "$KEYBINDS" | rofi -dmenu -i -p "Keybinds" -config ~/.config/rofi/config-keybinds.rasi
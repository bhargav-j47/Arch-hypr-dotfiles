#!/bin/bash
# /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  ##
# Rofi menu for Quick Edit/View of Settings (SUPER E)

# Define preferred text editor and terminal
edit=${EDITOR:-nano}
tty=kitty

# Paths to configuration directories
configs="$HOME/.config/hypr/configs"
UserConfigs="$HOME/.config/hypr/UserConfigs"

# Function to display the menu options
menu() {
    cat <<EOF
1. View / Edit  Env-variables
2. View / Edit  Window-Rules
3. View / Edit  Startup_Apps
4. View / Edit  User-Keybinds
5. View / Edit  Monitors
6. View / Edit  Laptop-Keybinds
7. View / Edit  User-Settings
8. View / Edit  Decorations
9. View / Edit  Animations
10. View / Edit  Workspace-Rules
11. View / Edit  Default-Keybinds
EOF
}

# Main function to handle menu selection
main() {
    choice=$(menu | rofi -i -dmenu -config ~/.config/rofi/config-compact.rasi | cut -d. -f1)
    
    # Map choices to corresponding files
    case $choice in
        1) file="$UserConfigs/ENVariables.lua" ;;
        2) file="$UserConfigs/WindowRules.lua" ;;
        3) file="$UserConfigs/Startup_Apps.lua" ;;
        4) file="$UserConfigs/UserKeybinds.lua" ;;
        5) file="$UserConfigs/Monitors.lua" ;;
        6) file="$UserConfigs/Laptops.lua" ;;
        7) file="$UserConfigs/UserSettings.lua" ;;
        8) file="$UserConfigs/UserDecorations.lua" ;;
        9) file="$UserConfigs/UserAnimations.lua" ;;
        10) file="$UserConfigs/WorkspaceRules.lua" ;;
        11) file="$configs/Keybinds.lua" ;;
        *) return ;;  # Do nothing for invalid choices
    esac

    # Fallback to .conf if .lua does not exist
    if [[ ! -f "$file" ]]; then
        file="${file%.lua}.conf"
    fi

    # Open the selected file in the terminal with the text editor
    $tty -e $edit "$file"
}

# Check if rofi is already running
if pidof rofi > /dev/null; then
  pkill rofi
fi

main

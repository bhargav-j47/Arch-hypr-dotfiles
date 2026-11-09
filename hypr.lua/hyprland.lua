-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- always refer to Hyprland wiki
-- https://wiki.hyprland.org/

-- Ensure module resolution from the hypr configuration directory
local config_dir = os.getenv("HOME") .. "/.config/hypr"
package.path = config_dir .. "/?.lua;" .. config_dir .. "/?/init.lua;" .. package.path

-- Initial boot script enable to apply initial wallpapers, theming, new settings etc.
-- suggest not to change this or delete this including deleting referrence file in ~/.config/hypr/.initial_startup_done
-- as long as the referrence file is present, this initial-boot.sh will not execute
hl.on("hyprland.start", function()
    hl.exec_cmd(config_dir .. "/initial-boot.sh")
end)

-- Sourcing external config files
local configs = config_dir .. "/configs" -- Default Configs directory path

require("configs.Keybinds") -- Pre-configured keybinds

-- ## This is where you want to start tinkering
local UserConfigs = config_dir .. "/UserConfigs" -- User Configs directory path

require("UserConfigs.Startup_Apps")    -- put your start-up packages on this file

require("UserConfigs.ENVariables")     -- Environment variables to load

require("UserConfigs.Monitors")        -- Its all about your monitor config

require("UserConfigs.Laptops")         -- For laptop related

require("UserConfigs.LaptopDisplay")   -- Laptop display related. You need to read the comment on this file

require("UserConfigs.WindowRules")     -- all about Hyprland Window Rules and Layer Rules

require("UserConfigs.UserDecorations") -- Decorations config file

require("UserConfigs.UserAnimations")  -- Animation config file

require("UserConfigs.UserKeybinds")    -- Put your own keybinds here

require("UserConfigs.UserSettings")    -- Main Hyprland Settings.

require("UserConfigs.WorkspaceRules")  -- Hyprland workspaces

-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- This is where you put your own keybinds. Be Mindful to check as well ~/.config/hypr/configs/Keybinds.conf to avoid conflict
-- if you think I should replace the Pre-defined Keybinds in ~/.config/hypr/configs/Keybinds.conf , submit an issue or let me know in DC and present me a valid reason as to why, such as conflicting with global shortcuts, etc etc

-- See https://wiki.hyprland.org/Configuring/Keywords/ for more settings and variables
-- See also Laptops.conf for laptops keybinds

local mainMod   = "SUPER"
local files     = "thunar"
local term      = "kitty"
local scriptsDir  = os.getenv("HOME") .. "/.config/hypr/scripts"
local UserScripts = os.getenv("HOME") .. "/.config/hypr/UserScripts"

-- rofi App launcher
-- hl.bind(mainMod .. "_L", hl.dsp.exec_cmd("pkill rofi || rofi -show drun -modi drun,filebrowser,run,window"), { release = true }) -- Super Key to Launch rofi menu
hl.bind(mainMod .. " + D",  hl.dsp.exec_cmd("pkill rofi || rofi -show drun -modi drun,filebrowser,run,window")) -- Main Menu

hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" })) -- fake full screen

-- ags overview
hl.bind(mainMod .. " + A",        hl.dsp.exec_cmd("pkill rofi || true && ags -t 'overview'"))

hl.bind(mainMod .. " + Return",   hl.dsp.exec_cmd(term))  -- terminal
hl.bind(mainMod .. " + T",        hl.dsp.exec_cmd(files)) -- file manager

hl.bind(mainMod .. " + ALT + C",  hl.dsp.exec_cmd(UserScripts .. "/RofiCalc.sh")) -- calculator (qalculate)

-- pyprland
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd("pypr toggle term")) -- Dropdown terminal
hl.bind(mainMod .. " + Z",             hl.dsp.exec_cmd("pypr zoom"))          -- Toggle Desktop Zoom

-- User Added Keybinds
hl.bind(mainMod .. " + SHIFT + O",     hl.dsp.exec_cmd(UserScripts .. "/ZshChangeTheme.sh")) -- Change oh-my-zsh theme
hl.bind("ALT_L + SHIFT_L",             hl.dsp.exec_cmd(scriptsDir .. "/SwitchKeyboardLayout.sh"), { non_consuming = true }) -- Change keyboard layout

-- For passthrough keyboard into a VM
-- hl.bind(mainMod .. " + ALT + P", hl.dsp.submap("passthru"))
-- hl.submap("passthru", function()
-- to unbind
-- hl.bind(mainMod .. " + ALT + P", hl.dsp.submap("reset"))
-- end)


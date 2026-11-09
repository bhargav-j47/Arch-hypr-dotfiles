-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- Default Keybinds
-- visit https://wiki.hyprland.org/Configuring/Binds/ for more info

local mainMod   = "SUPER"
-- Default
local scriptsDir  = os.getenv("HOME") .. "/.config/hypr/scripts"
local configs     = os.getenv("HOME") .. "/.config/hypr/configs"
-- User
local UserConfigs = os.getenv("HOME") .. "/.config/hypr/UserConfigs"
local UserScripts = os.getenv("HOME") .. "/.config/hypr/UserScripts"

hl.bind("CTRL + ALT + Delete",  hl.dsp.exec_cmd("hyprctl dispatch exit 0"))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
hl.bind(mainMod .. " + F",      hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(scriptsDir .. "/KillActiveProcess.sh"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + ALT + F",   hl.dsp.exec_cmd("hyprctl dispatch workspaceopt allfloat"))
hl.bind("CTRL + ALT + L",          hl.dsp.exec_cmd(scriptsDir .. "/LockScreen.sh"))   -- screen lock
hl.bind("CTRL + ALT + P",          hl.dsp.exec_cmd(scriptsDir .. "/Wlogout.sh"))       -- power menu

-- FEATURES / EXTRAS
hl.bind(mainMod .. " + H",             hl.dsp.exec_cmd(scriptsDir .. "/KeyHints.sh"))       -- help file
hl.bind(mainMod .. " + ALT + R",       hl.dsp.exec_cmd(scriptsDir .. "/Refresh.sh"))         -- Refresh waybar, swaync, rofi
hl.bind(mainMod .. " + ALT + E",       hl.dsp.exec_cmd(scriptsDir .. "/RofiEmoji.sh"))        -- emoji menu
hl.bind(mainMod .. " + S",             hl.dsp.exec_cmd(scriptsDir .. "/RofiSearch.sh"))        -- Google search using rofi
hl.bind(mainMod .. " + SHIFT + B",     hl.dsp.exec_cmd(scriptsDir .. "/ChangeBlur.sh"))        -- Toggle blur settings
hl.bind(mainMod .. " + SHIFT + G",     hl.dsp.exec_cmd(scriptsDir .. "/GameMode.sh"))           -- Toggle animations ON/OFF
hl.bind(mainMod .. " + ALT + L",       hl.dsp.exec_cmd(scriptsDir .. "/ChangeLayout.sh"))       -- Toggle Master or Dwindle Layout
hl.bind(mainMod .. " + ALT + V",       hl.dsp.exec_cmd(scriptsDir .. "/ClipManager.sh"))         -- Clipboard Manager
hl.bind(mainMod .. " + SHIFT + N",     hl.dsp.exec_cmd("swaync-client -t -sw"))                   -- swayNC notification panel

-- FEATURES / EXTRAS (UserScripts)
hl.bind(mainMod .. " + E",             hl.dsp.exec_cmd(UserScripts .. "/QuickEdit.sh"))             -- Quick Edit Hyprland Settings
hl.bind(mainMod .. " + SHIFT + M",     hl.dsp.exec_cmd(UserScripts .. "/RofiBeats.sh"))              -- online music using rofi
hl.bind(mainMod .. " + W",             hl.dsp.exec_cmd(UserScripts .. "/WallpaperSelect.sh"))          -- Select wallpaper to apply
hl.bind(mainMod .. " + SHIFT + W",     hl.dsp.exec_cmd(UserScripts .. "/WallpaperEffects.sh"))          -- Wallpaper Effects by imagemagick
hl.bind("CTRL + ALT + W",              hl.dsp.exec_cmd(UserScripts .. "/WallpaperRandom.sh"))             -- Random wallpapers
hl.bind(mainMod .. " + ALT + O",       hl.dsp.exec_cmd("hyprctl setprop active opaque toggle"))            -- disable opacity on active window
hl.bind(mainMod .. " + SHIFT + K",     hl.dsp.exec_cmd(scriptsDir .. "/KeyBinds.sh"))                       -- search keybinds via rofi
hl.bind(mainMod .. " + SHIFT + A",     hl.dsp.exec_cmd(scriptsDir .. "/Animations.sh"))                       -- hyprland animations menu

-- Waybar / Bar related
hl.bind(mainMod .. " + B",             hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))              -- Toggle hide/show waybar
hl.bind(mainMod .. " + CTRL + B",      hl.dsp.exec_cmd(scriptsDir .. "/WaybarStyles.sh"))     -- Waybar Styles Menu
hl.bind(mainMod .. " + ALT + B",       hl.dsp.exec_cmd(scriptsDir .. "/WaybarLayout.sh"))      -- Waybar Layout Menu

-- Dwindle Layout
hl.bind(mainMod .. " + SHIFT + I",     hl.dsp.layout("togglesplit"))  -- only works on dwindle layout
hl.bind(mainMod .. " + P",             hl.dsp.window.pseudo())        -- dwindle

-- Master Layout
hl.bind(mainMod .. " + CTRL + D",      hl.dsp.layout("removemaster"))
hl.bind(mainMod .. " + I",             hl.dsp.layout("addmaster"))
hl.bind(mainMod .. " + J",             hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + K",             hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + CTRL + Return", hl.dsp.layout("swapwithmaster"))

-- Works on either layout (Master or Dwindle)
hl.bind(mainMod .. " + M",             hl.dsp.exec_cmd("hyprctl dispatch splitratio 0.3"))

-- group
hl.bind(mainMod .. " + G",             hl.dsp.group.toggle())         -- toggle group
hl.bind(mainMod .. " + CTRL + tab",    hl.dsp.group.next())           -- change focus to another window

-- Cycle windows if floating bring to top
hl.bind("ALT + tab",                   hl.dsp.window.cycle_next())
hl.bind("ALT + tab",                   hl.dsp.window.bring_to_top())

-- Special Keys / Hot Keys
hl.bind("XF86AudioRaiseVolume",        hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --inc"),    { repeating = true, locked = true }) -- volume up
hl.bind("XF86AudioLowerVolume",        hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --dec"),    { repeating = true, locked = true }) -- volume down
hl.bind("XF86AudioMicMute",            hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle-mic"), { locked = true }) -- mic mute
hl.bind("XF86AudioMute",               hl.dsp.exec_cmd(scriptsDir .. "/Volume.sh --toggle"),     { locked = true }) -- mute
hl.bind("XF86Sleep",                   hl.dsp.exec_cmd("systemctl suspend"),                      { locked = true }) -- sleep button
hl.bind("XF86RFKill",                  hl.dsp.exec_cmd(scriptsDir .. "/AirplaneMode.sh"),         { locked = true }) -- Airplane mode

-- media controls using keyboards
hl.bind("XF86AudioPause",              hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true })
hl.bind("XF86AudioPlay",               hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --pause"), { locked = true })
hl.bind("XF86AudioNext",               hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --nxt"),   { locked = true })
hl.bind("XF86AudioPrev",               hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --prv"),   { locked = true })
hl.bind("XF86AudioStop",               hl.dsp.exec_cmd(scriptsDir .. "/MediaCtrl.sh --stop"),  { locked = true })

-- Screenshot keybindings NOTE: You may need to press Fn key as well
hl.bind(mainMod .. " + Print",          hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --now"))   -- screenshot
hl.bind(mainMod .. " + SHIFT + Print",  hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --area"))  -- screenshot (area)
hl.bind(mainMod .. " + CTRL + Print",   hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in5"))   -- screenshot  (5 secs delay)
hl.bind(mainMod .. " + CTRL + SHIFT + Print", hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --in10")) -- screenshot (10 secs delay)
hl.bind("ALT + Print",                  hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --active")) -- screenshot (active window only)

-- screenshot with swappy (another screenshot tool)
hl.bind(mainMod .. " + SHIFT + S",      hl.dsp.exec_cmd(scriptsDir .. "/ScreenShot.sh --swappy")) -- screenshot (swappy)

-- Resize windows
hl.bind(mainMod .. " + SHIFT + left",   hl.dsp.window.resize({ x = -50, y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + right",  hl.dsp.window.resize({ x =  50, y = 0,   relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + up",     hl.dsp.window.resize({ x = 0,   y = -50, relative = true }), { repeating = true })
hl.bind(mainMod .. " + SHIFT + down",   hl.dsp.window.resize({ x = 0,   y =  50, relative = true }), { repeating = true })

-- Move windows
hl.bind(mainMod .. " + CTRL + left",    hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right",   hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up",      hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down",    hl.dsp.window.move({ direction = "down" }))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",           hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",          hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",             hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",           hl.dsp.focus({ direction = "down" }))

-- Workspaces related
hl.bind(mainMod .. " + tab",            hl.dsp.focus({ workspace = "m+1" }))
hl.bind(mainMod .. " + SHIFT + tab",    hl.dsp.focus({ workspace = "m-1" }))

-- Special workspace
hl.bind(mainMod .. " + SHIFT + U",      hl.dsp.window.move({ workspace = "special" }))
hl.bind(mainMod .. " + U",              hl.dsp.workspace.toggle_special())

-- The following mappings use the key codes to better support various keyboard layouts
-- 1 is code:10, 2 is code 11, etc
-- Switch workspaces with mainMod + [0-9]
hl.bind(mainMod .. " + code:10",        hl.dsp.focus({ workspace = 1  }))
hl.bind(mainMod .. " + code:11",        hl.dsp.focus({ workspace = 2  }))
hl.bind(mainMod .. " + code:12",        hl.dsp.focus({ workspace = 3  }))
hl.bind(mainMod .. " + code:13",        hl.dsp.focus({ workspace = 4  }))
hl.bind(mainMod .. " + code:14",        hl.dsp.focus({ workspace = 5  }))
hl.bind(mainMod .. " + code:15",        hl.dsp.focus({ workspace = 6  }))
hl.bind(mainMod .. " + code:16",        hl.dsp.focus({ workspace = 7  }))
hl.bind(mainMod .. " + code:17",        hl.dsp.focus({ workspace = 8  }))
hl.bind(mainMod .. " + code:18",        hl.dsp.focus({ workspace = 9  }))
hl.bind(mainMod .. " + code:19",        hl.dsp.focus({ workspace = 10 }))

-- Move active window and follow to workspace mainMod + SHIFT [0-9]
hl.bind(mainMod .. " + SHIFT + code:10", hl.dsp.window.move({ workspace = 1  }))
hl.bind(mainMod .. " + SHIFT + code:11", hl.dsp.window.move({ workspace = 2  }))
hl.bind(mainMod .. " + SHIFT + code:12", hl.dsp.window.move({ workspace = 3  }))
hl.bind(mainMod .. " + SHIFT + code:13", hl.dsp.window.move({ workspace = 4  }))
hl.bind(mainMod .. " + SHIFT + code:14", hl.dsp.window.move({ workspace = 5  }))
hl.bind(mainMod .. " + SHIFT + code:15", hl.dsp.window.move({ workspace = 6  }))
hl.bind(mainMod .. " + SHIFT + code:16", hl.dsp.window.move({ workspace = 7  }))
hl.bind(mainMod .. " + SHIFT + code:17", hl.dsp.window.move({ workspace = 8  }))
hl.bind(mainMod .. " + SHIFT + code:18", hl.dsp.window.move({ workspace = 9  }))
hl.bind(mainMod .. " + SHIFT + code:19", hl.dsp.window.move({ workspace = 10 }))
hl.bind(mainMod .. " + SHIFT + bracketleft",  hl.dsp.window.move({ workspace = "-1" })) -- brackets [ or ]
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.window.move({ workspace = "+1" }))

-- Move active window to a workspace silently mainMod + CTRL [0-9]
hl.bind(mainMod .. " + CTRL + code:10",  hl.dsp.window.move({ workspace = 1,  silent = true }))
hl.bind(mainMod .. " + CTRL + code:11",  hl.dsp.window.move({ workspace = 2,  silent = true }))
hl.bind(mainMod .. " + CTRL + code:12",  hl.dsp.window.move({ workspace = 3,  silent = true }))
hl.bind(mainMod .. " + CTRL + code:13",  hl.dsp.window.move({ workspace = 4,  silent = true }))
hl.bind(mainMod .. " + CTRL + code:14",  hl.dsp.window.move({ workspace = 5,  silent = true }))
hl.bind(mainMod .. " + CTRL + code:15",  hl.dsp.window.move({ workspace = 6,  silent = true }))
hl.bind(mainMod .. " + CTRL + code:16",  hl.dsp.window.move({ workspace = 7,  silent = true }))
hl.bind(mainMod .. " + CTRL + code:17",  hl.dsp.window.move({ workspace = 8,  silent = true }))
hl.bind(mainMod .. " + CTRL + code:18",  hl.dsp.window.move({ workspace = 9,  silent = true }))
hl.bind(mainMod .. " + CTRL + code:19",  hl.dsp.window.move({ workspace = 10, silent = true }))
hl.bind(mainMod .. " + CTRL + bracketleft",  hl.dsp.window.move({ workspace = "-1", silent = true })) -- brackets [ or ]
hl.bind(mainMod .. " + CTRL + bracketright", hl.dsp.window.move({ workspace = "+1", silent = true }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down",     hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",       hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + period",         hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + comma",          hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272",      hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273",      hl.dsp.window.resize(), { mouse = true })


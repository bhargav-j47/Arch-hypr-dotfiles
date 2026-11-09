-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- Commands & Apps to be executed at launch

local scriptsDir  = os.getenv("HOME") .. "/.config/hypr/scripts"
local UserScripts = os.getenv("HOME") .. "/.config/hypr/UserScripts"

local wallDIR   = os.getenv("HOME") .. "/Pictures/wallpapers"
local lock      = scriptsDir  .. "/LockScreen.sh"
local SwwwRandom = UserScripts .. "/WallpaperAutoChange.sh"

hl.on("hyprland.start", function()
    -- wallpaper stuff / More wallpaper options below
    hl.exec_cmd("awww-daemon --format xrgb")
    -- hl.exec_cmd(SwwwRandom .. " " .. wallDIR) -- random wallpaper switcher every 30 minutes

    -- Startup
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")

    -- Polkit (Polkit Gnome / KDE)
    hl.exec_cmd(scriptsDir .. "/Polkit.sh")

    -- starup apps
    hl.exec_cmd("waybar")
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("swaync")
    hl.exec_cmd("ags")
    hl.exec_cmd("blueman-applet")
    -- hl.exec_cmd("rog-control-center")

    -- clipboard manager
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")

    -- Rainbow borders
    -- hl.exec_cmd(UserScripts .. "/RainbowBorders.sh")

    -- Starting hypridle to start hyprlock
    hl.exec_cmd("hypridle")

    -- Start pyprland daemon
    hl.exec_cmd("pypr")

    -- Here are list of features available but disabled by default
    -- hl.exec_cmd("awww-daemon --format xrgb && awww img " .. os.getenv("HOME") .. "/Pictures/wallpapers/mecha-nostalgia.png") -- persistent wallpaper

    -- gnome polkit for nixos
    -- hl.exec_cmd(scriptsDir .. "/Polkit-NixOS.sh")

    -- xdg-desktop-portal-hyprland (should be auto starting. However, you can force to start)
    -- hl.exec_cmd(scriptsDir .. "/PortalHyprland.sh")
end)


-- /* ---- 💫 https://github.com/JaKooLit 💫 ---- */  --
-- Environment variables. See https://wiki.hyprland.org/Configuring/Environment-variables/

-- Set your defaults here
-- hl.env("EDITOR", "vim") -- default editor

-- environment-variables
hl.env("CLUTTER_BACKEND",                   "wayland")
hl.env("GDK_BACKEND",                       "wayland,x11")
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR",       "1")
hl.env("QT_QPA_PLATFORM",                   "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME",              "qt5ct")
hl.env("QT_QPA_PLATFORMTHEME",              "qt6ct")
hl.env("QT_SCALE_FACTOR",                   "1")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("XDG_CURRENT_DESKTOP",               "Hyprland")
hl.env("XDG_SESSION_DESKTOP",               "Hyprland")
hl.env("XDG_SESSION_TYPE",                  "wayland")

-- hyprland-qt-support
hl.env("QT_QUICK_CONTROLS_STYLE", "org.hyprland.style")

-- xwayland apps scale fix (useful if you are use monitor scaling)
-- see https://wiki.hyprland.org/Configuring/XWayland/
-- toolkit-specific scale
hl.env("GDK_SCALE", "1")

-- Bibata-Modern-Ice-Cursor
-- NOTE! You must have the hyprcursor version to activate this.
-- If you installed from 26-Dec-2024 and choose GTK theme, then you have it.
-- https://wiki.hyprland.org/Hypr-Ecosystem/hyprcursor/
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("HYPRCURSOR_SIZE",  "24")

-- firefox
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- electron >28 apps (may help)
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- NVIDIA
-- This is from Hyprland Wiki. Below will be activated nvidia gpu detected
-- See hyprland wiki https://wiki.hyprland.org/Nvidia/#environment-variables
hl.env("LIBVA_DRIVER_NAME",        "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("NVD_BACKEND",              "direct")

-- to use nvidia as primary renderer (need hyprland >0.45)
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card1") -- (nvidia)
-- hl.env("AQ_DRM_DEVICES", "/dev/dri/card0")

-- additional ENV's for nvidia. Caution, activate with care
-- hl.env("GBM_BACKEND", "nvidia-drm")

-- hl.env("__NV_PRIME_RENDER_OFFLOAD", "1")
-- hl.env("__VK_LAYER_NV_optimus", "NVIDIA_only")
-- hl.env("WLR_DRM_NO_ATOMIC", "1")

-- FOR VM and POSSIBLY NVIDIA
-- LIBGL_ALWAYS_SOFTWARE software mesa rendering
-- hl.env("LIBGL_ALWAYS_SOFTWARE", "1") -- Warning. May cause hyprland to crash
-- hl.env("WLR_RENDERER_ALLOW_SOFTWARE", "1")

-- nvidia firefox (for hardware acceleration on FF)?
-- check this post https://github.com/elFarto/nvidia-vaapi-driver#configuration
-- hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
-- hl.env("EGL_PLATFORM", "wayland")


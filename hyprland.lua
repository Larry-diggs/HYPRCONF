-- Hyprland Configuration (Lua)
-- Migrated from hyprlang → Lua for Hyprland v0.55+
-- https://wiki.hypr.land/Configuring/Start/

-- ==================
-- Monitors 
-- ==================
hl.monitor({
    output   = "desc:LG Display 0x0742",
    mode     = "1920x1080@144.0",
    position = "0x0",
    scale    = 1.0,
})

-- ==================
-- STARTUP APPS
-- ==================
-- Note: exec-once is replaced by hl.on("hyprland.start", ...) which runs once on startup.
hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --systemd --all")
    hl.exec_cmd("systemctl --user start hyprland-session.target")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-theme BreezeX-Black")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 24")
    hl.exec_cmd("hyprctl setcursor BreezeX-Dark 24")
end)

-- ==================
-- ENVIRONMENT VARIABLES
-- ==================
hl.env("HYPRCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("HYPRCURSOR_SIZE",  "19")
hl.env("XCURSOR_THEME",    "BreezeX-Black")
hl.env("XCURSOR_SIZE",     "19")
hl.env("GDK_BACKEND",      "wayland")
hl.env("XCURSOR_PATH",     "/home/USERNAME/.local/share/icons:/usr/local/share/icons:/usr/share/icons")
hl.env("SDL_VIDEO_WAYLAND_SCALE_TO_DISPLAY", "1")
hl.env("QT_QPA_PLATFORMTHEME",      "qt6ct")
hl.env("QT_QPA_PLATFORMTHEME_QT6",  "qt6ct")

-- ==================
-- CONFIGURATION
-- ==================
hl.config({
    input = {
        kb_layout    = "us",
        follow_mouse = 1,
        sensitivity  = 0.0,
        accel_profile = "flat",
    },

    dwindle = {
      preserve_split = true,
      force_split = 2,
  },

    general = {
        gaps_in          = 5,
        gaps_out         = 10,
        border_size      = 2,
        col = {
          active_border   = "rgba(0DB7D4FF)",
          inactive_border = "rgba(31313600)",
        },
        layout           = "dwindle",
        resize_on_border = false,
    },

    decoration = {
        rounding          = 0,
        active_opacity    = 1.0,
        inactive_opacity  = 1.0,
        fullscreen_opacity = 1.0,

     blur = {
      enabled = true,
      size = 2,
      passes = 2,
      special = true,
      brightness = 0.60,
      contrast = 0.75,
    },

     shadow = {
      enabled = true,
      range = 2,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
   },

      animations = {
    enabled = true,
  },
})


hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = false })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "easeOutQuint", style = "slidevert" })
-- ==================
-- KEY BINDINGS
-- ==================
local mainMod = "SUPER"

-- Applications
hl.bind(mainMod .. " + RETURN",        hl.dsp.exec_cmd("kitty"))       		     -- Open the terminal
hl.bind(mainMod .. " + B",             hl.dsp.exec_cmd("firefox"))     		     -- Open the browser
hl.bind(mainMod .. " + E",             hl.dsp.exec_cmd("nautilus"))     	     -- Open the filemanager
hl.bind(mainMod .. " + ALT + J",       hl.dsp.exec_cmd("flatpak run com.adamcake.Bolt"))        -- Open Runescape
hl.bind(mainMod .. " + D",    	       hl.dsp.exec_cmd("discord"))                              -- Open Discord
hl.bind(mainMod .. " + A", 	       hl.dsp.exec_cmd("exec dms ipc call spotlight toggle"))   -- Open Application Launcher 
hl.bind(mainMod .. " + W", 	       hl.dsp.exec_cmd("exec dms ipc call dankdash wallpaper")) -- Open Wallpaper Switcher 
-- Windows
hl.bind(mainMod .. " + Q",             hl.dsp.window.close())                         -- Kill active window
hl.bind(mainMod .. " + F",             hl.dsp.window.float({ action = "toggle" }))   -- Toggle Float
hl.bind(mainMod .. " + left",          hl.dsp.focus ({ direction = "l" }))           -- Move focus left
hl.bind(mainMod .. " + right",         hl.dsp.focus({ direction = "r" }))            -- Move focus right
hl.bind(mainMod .. " + up",            hl.dsp.focus({ direction = "u" }))            -- Move focus up
hl.bind(mainMod .. " + down",          hl.dsp.focus({ direction = "d" }))            -- Move focus down
hl.bind(mainMod .. " + mouse:272",     hl.dsp.window.drag(),   { mouse = true })     -- Move window with the mouse
hl.bind(mainMod .. " + mouse:273",     hl.dsp.window.resize(), { mouse = true })     -- Resize window with the mouse
hl.bind(mainMod .. " + ALT + left",    hl.dsp.window.swap({ direction = "l" }))      -- Swap tiled window left
hl.bind(mainMod .. " + ALT + right",   hl.dsp.window.swap({ direction = "r" }))      -- Swap tiled window right
hl.bind(mainMod .. " + ALT + up",      hl.dsp.window.swap({ direction = "u" }))      -- Swap tiled window up
hl.bind(mainMod .. " + ALT + down",    hl.dsp.window.swap({ direction = "d" }))      -- Swap tiled window down
hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())                                          -- Cycle between windows
    hl.dispatch(hl.dsp.window.bring_to_top())                                        -- Bring active window to the top
end, { repeating = true })

-- Switch workspaces with mainmod + 0-9
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0 
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i}))          
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end 											
-- Workspace scroll
hl.bind(mainMod .. " + mouse_down",  hl.dsp.focus({ workspace = "e+1" })) -- Scroll next workspace
hl.bind(mainMod .. " + mouse_up",    hl.dsp.focus({ workspace = "e+1" })) -- Scroll previous workspace

-- Fn keys
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -q s +10%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q s 10%-"))
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ 0 && pactl set-sink-volume @DEFAULT_SINK@ -5%"))
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl pause"))
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))
hl.bind("code:238",              hl.dsp.exec_cmd("brightnessctl -d smc::kbd_backlight s +10"))
hl.bind("code:237",              hl.dsp.exec_cmd("brightnessctl -d smc::kbd_backlight s 10-"))

-- ==================
-- WINDOW RULES
-- ==================

hl.window_rule({
    match = { class = "org%.wezfurlong%.wezterm" },
    tile  = true,
})
hl.window_rule({
    match    = { class = "org%.gnome%." },
    rounding = 12,
})
hl.window_rule({
    match = { class = "gnome-control-center" },
    tile  = true,
})
hl.window_rule({
    match = { class = "pavucontrol" },
    tile  = true,
})
hl.window_rule({
    match = { class = "nm-connection-editor" },
    tile  = true,
})
hl.window_rule({
    match = { class = "org%.gnome%.Calculator" },
    float = true,
})
hl.window_rule({
    name  = "float-calculator",
    match = { class = "org.gnome.Calculator" },
    float = true,
})
hl.window_rule({
    match = { class = "galculator" },
    float = true,
})
hl.window_rule({
    match = { class = "blueman-manager" },
    float = true,
})
hl.window_rule({
    match = { class = "org.gnome.Nautilus" },
    float = true,
})
hl.window_rule({
    match = { class = "xdg-desktop-portal" },
    float = true,
})
hl.window_rule({
    match            = { class = "steam", title = "notificationtoasts" },
    no_initial_focus = true,
})
hl.window_rule({
    match = { class = "steam", title = "notificationtoasts" },
    pin   = true,
})
hl.window_rule({
    match = { class = "firefox", title = "Picture-in-Picture" },
    float = true,
})
hl.window_rule({
    match = { class = "zoom" },
    float = true,
})
hl.window_rule({
    match = { class = "org.quickshell" },
    float = true,
})
hl.window_rule({
    name    = "windowrule-1",
    match   = { title = "^RuneLite$" },
    opacity = 1.0,
    float   = true,
    center  = true,
})
hl.window_rule({
    name    = "windowrule-2",
    match   = { title = "^MTGA$" },
    opacity = 1.0,
    float   = true,
    size    = { 1024, 576 },
})

-- ==================
-- LAYER RULES
-- ==================

hl.layer_rule({ match = { namespace = "quickshell" }, no_anim = true })
hl.layer_rule({ match = { namespace = "dms:.*" },     no_anim = true })

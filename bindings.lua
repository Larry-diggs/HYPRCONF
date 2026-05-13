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

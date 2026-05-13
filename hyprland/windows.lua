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

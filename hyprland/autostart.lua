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


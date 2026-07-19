-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" })

-- Fix some dragging issues with XWayland
hl.window_rule({
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})

-- Float dialogs
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true })

-- Force Hyprland's screen sharing dialog to be visible
hl.window_rule({
  match = { class = "^(hyprland-share-picker)" },
  float = true,
  center = true,
  stay_focused = true,
  size = { 800, 600 },
})

--
-- App-specific rules
--

-- Prevent new mail from bringing hidden terminal running mutt to the front
hl.window_rule({
  match = { class = "^(kitty)$" },
  suppress_event = "activatefocus",
})

-- Enpass
hl.window_rule({
  match = { title = "Enpass Assistant" },
  move = { "(cursor_x-(window_w*0.5))", "(cursor_y-(window_h*0.5))" },
})

-- Firefox
for _, title in ipairs({ "Picture-in-Picture", "Library" }) do
  hl.window_rule({
    match = { class = "firefox", title = title },
    float = true,
    persistent_size = true,
  })
end

-- GIMP
for _, class in ipairs({ "file-png", "org.gimp.GIMP" }) do
  hl.window_rule({
    match = { class = class },
    center = true,
    float = true,
  })
end

-- GNOME Pomodoro
hl.window_rule({
  match = { class = "gnome-pomodoro" },
  workspace = "special:scratch",
})
hl.window_rule({
  match = { class = "gnome-pomodoro", title = "Preferences" },
  float = true,
  persistent_size = true,
})

-- nwg-look
hl.window_rule({
  match = { class = "nwg-look", title = "nwg-look" },
  size = { "(monitor_w*0.33)", "(monitor_h*0.5)" },
  center = true,
  float = true,
})

-- Obsidian
hl.window_rule({
  match = { class = "obsidian" },
  size = { "(monitor_w*0.5)", "(monitor_h*0.9)" },
  pseudo = true,
  workspace = "special:notes",
})

-- Messaging apps
for _, class in ipairs({
  "discord",
  "com.fastmail.Fastmail",
  "com.mattermost.Desktop",
  "com.slack.Slack"
}) do
  hl.window_rule({
    match = { class = "^(" .. class .. ")$" },
    size = { "(monitor_w*0.66)", "(monitor_h*0.95)" },
    workspace = "special:comms",
  })
end

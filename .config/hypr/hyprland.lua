-- For examples/inspiration see:
-- https://github.com/hyprwm/Hyprland/blob/main/example/hyprland.lua

-- You can use print() for debugging your Lua. 
--  the logs with `hyprctl rollinglog -f`
--
-- hl.config({ debug = { disable_logs = false } })

require("monitors")
require("input-devices")
require("autostart")

require("bindings.launchers")
require("bindings.media")
require("bindings.utilities")
require("bindings.windows")
require("bindings.workspaces")

require("layouts")
require("look-and-feel")
require("window-rules")

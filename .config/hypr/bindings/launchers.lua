local launch = function(command)
  return hl.dsp.exec_cmd("uwsm app -- " .. command)
end

hl.bind(
  "SUPER + space",
  hl.dsp.exec_cmd("pidof -q wofi && pkill -f wofi || /usr/bin/wofi")
)

local terminal = "kitty"

hl.bind("SUPER + backslash", launch(terminal))
hl.bind("SUPER + T", launch(terminal .. " -o font_size=12 --title btop btop"))

hl.bind("SUPER + F", launch("nautilus"))
hl.bind("SUPER + W", launch("firefox"))

hl.bind("SUPER + E", launch("enpass"))
hl.bind("SUPER + ALT + slash", launch("enpass showassistant"))

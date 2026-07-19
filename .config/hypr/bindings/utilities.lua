-- Locking the screen, suspending, logging out, etc
hl.bind("SUPER + Escape", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind(
  "SUPER + CTRL + Escape",
  hl.dsp.exec_cmd("(sleep 1; systemctl suspend) & loginctl lock-session")
)
hl.bind("SUPER + CTRL + SHIFT + Escape", hl.dsp.exit())

-- Taking screenshots

local screenshot = function(mode)
  local command = "hyprshot -o ~/Pictures/Screenshots --freeze --silent --mode "
  return hl.dsp.exec_cmd(command .. mode)
end

hl.bind("SUPER + Print", screenshot("output"))
hl.bind("SUPER + CTRL + Print", screenshot("window"))
hl.bind("SUPER + CTRL + SHIFT + Print", screenshot("region"))

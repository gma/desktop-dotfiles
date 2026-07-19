--  Special workspaces
local special = {}
special.comms = "C"
special.docs = "D"
special.notes = "N"
special.scratch = "S"

for name, key in pairs(special) do
  hl.bind("SUPER + " .. key, hl.dsp.workspace.toggle_special(name))
  hl.bind(
    "SUPER + SHIFT + " .. key,
    hl.dsp.window.move({ workspace = "special:" .. name })
  )
end

-- Navigating between workspaces
for i = 1, 9 do
  hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = "10" }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

hl.bind("SUPER + minus", hl.dsp.focus({ workspace = "-1" }))
hl.bind("SUPER + equal", hl.dsp.focus({ workspace = "+1" }))

hl.bind("SUPER + SHIFT + minus", hl.dsp.window.move({ workspace = "-1" }))
hl.bind("SUPER + SHIFT + equal", hl.dsp.window.move({ workspace = "+1" }))

-- Moving workspace between monitors
hl.bind("SUPER + CTRL + ALT + h", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("SUPER + CTRL + ALT + l", hl.dsp.workspace.move({ monitor = "r" }))

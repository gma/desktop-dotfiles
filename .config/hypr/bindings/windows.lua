hl.bind("SUPER + G", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + M", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind("SUPER + SHIFT + M", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind("SUPER + P", hl.dsp.window.pseudo())
hl.bind("SUPER + Q", hl.dsp.window.kill())
hl.bind("SUPER + O", hl.dsp.layout("togglesplit"))

-- Moving and resizing windows

local resize_active = function(keys, x, y)
  hl.bind(
    keys,
    hl.dsp.window.resize({ x = x, y = y, relative = true }),
    { repeating = true }
  )
end

local resize_step = 64
resize_active("SUPER + SHIFT + h", -resize_step, 0)
resize_active("SUPER + SHIFT + j", 0, resize_step)
resize_active("SUPER + SHIFT + k", 0, -resize_step)
resize_active("SUPER + SHIFT + l", resize_step, 0)

local directions = { h = "l", j = "d", k = "u", l = "r" }
local arrows = { h = "Left", j = "Down", k = "Up", l = "Right" }

for key, dir in pairs(directions) do
  hl.bind("SUPER + " .. key, hl.dsp.focus({ direction = dir }))
  hl.bind("SUPER + " .. arrows[key], hl.dsp.focus({ direction = dir }))

  hl.bind("SUPER + CTRL + " .. key, hl.dsp.window.swap({ direction = dir }))

  hl.bind("SUPER + CTRL + SHIFT + " .. key, hl.dsp.window.move({ direction = dir }))
end

-- Move/resize windows with mouse
-- mouse:272 is left mouse button, :273 is right button
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

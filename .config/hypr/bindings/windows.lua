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

local function layout_bind(bind_table)
  return function ()
    local workspace = hl.get_active_special_workspace() or
    hl.get_active_workspace()
    if not workspace then return end

    local layout = workspace.tiled_layout

    if bind_table[layout] then
      hl.dispatch(bind_table[layout])
    end
  end
end

local function is_previous(key)
  for _, value in ipairs({ "h", "k", "Left", "Up" }) do
    if key == value then return true end
  end
  return false
end

-- Focusing, swapping, and moving windows
for key, dir in pairs(directions) do
  local cycler = is_previous(key) and "cycleprev" or "cyclenext"
  local focus_binds = {
    dwindle = hl.dsp.focus({ direction = dir }),
    scrolling = hl.dsp.focus({ direction = dir }),
    master = hl.dsp.focus({ direction = dir }),
    monocle = hl.dsp.layout(cycler),
  }
  hl.bind("SUPER + " .. key, layout_bind(focus_binds))
  hl.bind("SUPER + " .. arrows[key], layout_bind(focus_binds))

  local swap_binds = {
    dwindle = hl.dsp.window.swap({ direction = dir }),
    master = hl.dsp.window.swap({ direction = dir }),
    scrolling = hl.dsp.window.swap({ direction = dir }),
  }
  hl.bind("SUPER + CTRL + " .. key, layout_bind(swap_binds))

  local move_binds = {
    dwindle = hl.dsp.window.move({ direction = dir }),
    master = hl.dsp.window.move({ direction = dir }),
    scrolling = hl.dsp.window.move({ direction = dir }),
  }
  hl.bind("SUPER + CTRL + SHIFT + " .. key, layout_bind(move_binds))
end

-- Move/resize windows with mouse
-- mouse:272 is left mouse button, :273 is right button
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + SHIFT + mouse:272", hl.dsp.window.resize(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

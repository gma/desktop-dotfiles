local theme = require("mocha")

local border_colors = {
  dwindle = theme.colour("rosewater"),
  monocle = theme.colour("sapphire"),
  scrolling = theme.colour("yellow"),
}

local function workspace_selector(workspace)
  return tostring(workspace.special and workspace.name or workspace.id)
end

local function set_active_border(workspace, layout)
  local selector = workspace_selector(workspace)
  layout = layout or workspace.tiled_layout

  hl.window_rule({
    name = "layout-active-border-" .. selector,
    match = { workspace = selector },
    border_color = border_colors[layout] or border_colors.dwindle,
  })
end

hl.bind("SUPER + CTRL + M", function ()
  local layouts = { "dwindle", "scrolling", "monocle" }
  local workspace = (
    hl.get_active_special_workspace() or hl.get_active_workspace()
  )

  if not workspace then return end

  local next_layout = "dwindle"

  for i = 1, #layouts do
    if layouts[i] == workspace.tiled_layout then
      local next_layout_idx = (i % #layouts) + 1
      next_layout = layouts[next_layout_idx]
      break
    end
  end

  hl.workspace_rule({
    workspace = workspace_selector(workspace),
    layout = next_layout
  })

  set_active_border(workspace, next_layout)

  hl.dispatch(hl.dsp.window.pseudo({
    action = (next_layout == "monocle") and "enable" or "disable"
  }))
end)

-- Set active window border on workspaces created at startup
local function set_active_border_on_all_workspaces()
  for _, workspace in ipairs(hl.get_workspaces()) do
    set_active_border(workspace)
  end
end

hl.on("hyprland.start", set_active_border_on_all_workspaces)
hl.on("config.reloaded", set_active_border_on_all_workspaces)

-- Set active window border on dynamically created workspaces
hl.on("workspace.created", function(workspace)
  set_active_border(workspace)
end)

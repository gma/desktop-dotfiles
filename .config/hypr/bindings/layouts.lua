hl.bind("SUPER + CTRL + M", function ()
  local layouts     = { "dwindle", "monocle" }
  local workspace   = hl.get_active_workspace()
  if hl.get_active_special_workspace() then
    workspace = hl.get_active_special_workspace()
  end

  if not workspace then
    return
  end

  local next_layout = "dwindle"

  for i = 1, #layouts do
    if layouts[i] == workspace.tiled_layout then
      local next_layout_idx = (i % #layouts) + 1
      next_layout = layouts[next_layout_idx]
      break
    end
  end

  if workspace.special then
    hl.workspace_rule({ workspace = tostring(workspace.name), layout = next_layout })
  else
    hl.workspace_rule({ workspace = tostring(workspace.id), layout = next_layout })
  end

  hl.dispatch(hl.dsp.window.pseudo())
end)

hl.bind("SUPER + CTRL + M", function ()
  local layouts = { "dwindle", "monocle", "scrolling" }
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
    workspace = tostring(workspace.special and workspace.name or workspace.id),
    layout = next_layout
  })

  hl.dispatch(hl.dsp.window.pseudo())
end)

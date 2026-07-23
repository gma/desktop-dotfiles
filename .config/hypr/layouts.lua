hl.config({
  dwindle = {
    preserve_split = true,
    force_split = 2,					-- position new windows to right/bottom
  },

  master = {
    new_status = "master",
  },

  scrolling = {
    focus_fit_method = 0,
    column_width = 0.6,
  },
})

-- Workspace-specific layouts
hl.workspace_rule({ workspace = "special:comms", layout = "scrolling" })

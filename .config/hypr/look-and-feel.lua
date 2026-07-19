local colours = require("mocha")

hl.config({
  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,

    focus_on_activate = true,
  },

  general = {
    layout = "dwindle",

    gaps_in = 1,
    gaps_out = 4,

    border_size = 3,

    resize_on_border = false,

    col = {
      active_border = colours["rosewaterAlphacc"],
      inactive_border = colours["crust"],
    },

    allow_tearing = false,
  },

  decoration = {
    rounding = 0,
    rounding_power = 2,

    active_opacity = 1.0,

    shadow = {
      enabled = false,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },

    blur = {
      enabled = true,
      size = 3,
      passes = 1,

      vibrancy = 0.1696,
    }
  }
})

hl.animation({ leaf = "global", enabled = false })

-- Disable gaps and borders on maximised windows

-- w[tv1] matches when only one [t]iled and [v]isible window on workspace
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })

-- f[1] matches when fullscreen state is "maximized"
-- (-1: no fullscreen, 0: fullscreen, 2: fullscreen without telling client)
hl.workspace_rule({ workspace = "f[1]", border_size = 0 })

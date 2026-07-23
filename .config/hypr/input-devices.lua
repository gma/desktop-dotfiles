hl.config({
  input = {
    kb_layout = "gb",
    kb_variant = "",
    kb_model = "",
    kb_options = "ctrl:nocaps",
    kb_rules = "",

    follow_mouse = 1,

    sensitivity = -0.6,

    touchpad = {
      natural_scroll = true,
    },

    scroll_method = "on_button_down",
    scroll_button = 273,
    scroll_factor = 0.3,
    natural_scroll = true,
  }
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.device({
    name = "tpps/2-elan-trackpoint",   -- P14s Trackpoint

    sensitivity = 0.25,
    accel_profile = "flat",

    scroll_button = 0,                 -- 0 means default (middle button)
    scroll_method = "on_button_down"
})

hl.device({
  name = "synps/2-synaptics-touchpad", -- P14s Touchpad
  sensitivity = 0.3,
})

hl.device({
  name = "kensington-usb/ps2-orbit",
  sensitivity = -0.3,
  middle_button_emulation = true,
})

hl.device({
  name = "mosart-semi.-orbit-wireless-mobile-trackball",
  sensitivity = -0.3,
  middle_button_emulation = true,
})

hl.device({
  name = "ploopy-corporation-ploopy-adept-trackball-mouse",
  sensitivity = -0.8,
})

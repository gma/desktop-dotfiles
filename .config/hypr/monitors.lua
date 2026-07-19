hl.monitor({
  output = "",              -- matches all displays
  mode = "preferred",
  position = "auto",        -- to right of existing displays
  scale = "auto"
})

hl.monitor({
  output = "eDP-1",         -- laptop's internal display
  mode = "preferred",
  position = "auto-left",   -- to left of external monitor when lid opened
  scale = 1
})

-- Mirror laptop to external display
-- hl.monitor({
--   output = "DP-1",
--   mode = "preferred",
--   position = "auto",
--   scale = "auto",
--   mirror = "eDP-1"
-- })

-- Use 10 bit colour on BenQ monitor
hl.monitor({
  output = "BNQ BenQ RD240Q",
  mode = "preferred",
  position = "auto",
  scale = "auto",
  bitdepth = 10
})

hl.bind(
  "switch:on:Lid Switch",
  hl.dsp.exec_cmd("~/.config/hypr/scripts/lidswitch on"),
  { locked = true }
)
hl.bind(
  "switch:off:Lid Switch",
  hl.dsp.exec_cmd("~/.config/hypr/scripts/lidswitch off"),
  { locked = true }
)

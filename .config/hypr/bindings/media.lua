local function get_volume()
  local handle = io.popen("wpctl get-volume @DEFAULT_AUDIO_SINK@")
  if not handle then
    return nil
  end
  local output = handle:read("*a")
  handle:close()
  local frac = tonumber(output:match("(%d+%.%d+)"))
  if not frac then
    return nil
  end
  return math.floor(frac * 100 + 0.5)
end

local volume = get_volume()
local step = (volume and volume % 2 == 1) and 3 or 2

hl.bind("XF86AudioRaiseVolume",
  hl.dsp.exec_cmd(
    string.format("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ %d%%+", step)
  ),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioLowerVolume",
  hl.dsp.exec_cmd(
    string.format("wpctl set-volume @DEFAULT_AUDIO_SINK@ %d%%-", step)
  ),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86AudioMicMute",
  hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
  { locked = true, repeating = true }
)

hl.bind(
  "XF86MonBrightnessUp",
  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),
  { locked = true, repeating = true }
)
hl.bind(
  "XF86MonBrightnessDown",
  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),
  { locked = true, repeating = true }
)

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

local play_pause = hl.dsp.exec_cmd("playerctl play-pause")
hl.bind("XF86AudioPause", play_pause, { locked = true })
hl.bind("XF86AudioPlay", play_pause, { locked = true })
hl.bind("XF86Favorites", play_pause, { locked = true })

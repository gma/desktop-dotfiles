local launch = function(command)
  hl.exec_cmd("uwsm app -- " .. command)
end

hl.on("hyprland.start", function()
  launch("hypridle")
  launch("hyprpaper")
  launch("swaync")
  launch("waybar")
end)

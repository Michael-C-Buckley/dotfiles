local optional = require("modules.lib.optional")
local rb = require("rootbeer")

require("modules.presets.desktop")

optional.link_files_when_binary("mango", {
  { "hosts/x570/mango.conf", "~/.config/mango/host.conf" },
})

optional.link_files_when_binary("hyprland", {
  { "hosts/x570/hyprland.lua", "~/.config/hypr/host.lua" },
})

optional.link_files_when_binary("noctalia", {
  { "configs/desktop/hyprland/noctalia.lua", "~/.config/hypr/noctalia.lua" },
})

local optional = require("modules.lib.optional")
local rb = require("rootbeer")

require("modules.desktop.hyprland")

optional.link_files_when_binary("mango", {
  { "hosts/t14/mango.conf", "~/.config/mango/host.conf" },
})

optional.link_files_when_binary("hyprland", {
  { "hosts/t14/hyprland.lua", "~/.config/hypr/host.lua" },
})

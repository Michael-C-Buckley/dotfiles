local rb = require("rootbeer")
require("modules.presets.linux")
require("modules.desktop.hyprland")

rb.link_file("hosts/t14/mango.conf", "~/.config/mango/host.conf")
rb.link("hosts/t14/hyprland.lua", "~/.config/hypr/host.lua")

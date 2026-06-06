local rb = require("rootbeer")
require("modules.presets.shells")
require("modules.desktop.hyprland")

rb.link_file("hosts/x570/mango.conf", "~/.config/mango/host.conf")
rb.link("hosts/x570/hyprland.lua", "~/.config/hypr/host.lua")
rb.link("configs/desktop/hyprland/noctalia.lua", "~/.config/hypr/noctalia.lua")

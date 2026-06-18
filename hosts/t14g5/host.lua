local optional = require("modules.lib.optional")
local rb = require("rootbeer")

local modules = {
  "apps.nvim",
  "desktop.oxwm",
  "presets.desktop",
  "presets.shells",
}

for i, v in ipairs(modules) do
  require("modules." .. v)
end

--rb.link_file("hosts/t14g5/mango.conf", "~/.config/mango/host.conf")
--rb.link("hosts/t14g5/hyprland.lua", "~/.config/hypr/host.lua")
--rb.link("configs/desktop/hyprland/noctalia.lua", "~/.config/hypr/noctalia.lua")

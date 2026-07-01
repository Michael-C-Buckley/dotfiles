local profile = require("rootbeer.profile")
local rb = require("rootbeer")

require("modules.presets.shells")

local apps = { "fastfetch", "helix", "zed" }
local desktop = { "hyprland", "oxwm", "waybar" }
local terminals = { "kitty" }

function import_items(family, dir)
  for i, v in ipairs(family) do
    require("modules." .. dir .. "." .. v)
  end
end

import_items(apps, "apps")
import_items(terminals, "terminals")
import_items(desktop, "desktop")

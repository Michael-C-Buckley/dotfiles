require("modules.presets.base")
require("modules.apps.nvim")

local desktop = { "niri", "oxwm", "mango", "waybar" }

for _, v in ipairs(desktop) do
  require("modules.desktop." .. v)
end

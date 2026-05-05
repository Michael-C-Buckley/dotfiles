local rb = require("rootbeer")
require("modules.presets.base")
require("apps.nvim")

local desktop = { "niri", "oxwm", "mango", "waybar" }

for i, v in ipairs(desktop) do
    require("modules.desktop." .. v)
end

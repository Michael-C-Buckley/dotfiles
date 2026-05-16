local rb = require("rootbeer")

local hypr = "configs/desktop/hyprland/"
local conf = "~/.config/hypr/"

local files = {"binds", "hyprland", "input", "lookfeel", "windows"}

for i, name in ipairs(files) do
    rb.link_file(hypr .. name .. ".lua", conf .. name .. ".lua")
end

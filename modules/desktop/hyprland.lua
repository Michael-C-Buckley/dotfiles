local optional = require("modules.lib.optional")

local hypr = "configs/desktop/hyprland/"
local conf = "~/.config/hypr/"

local files = { "binds", "hyprland", "input", "lookfeel", "windows" }
local links = {}

for _, name in ipairs(files) do
  links[#links + 1] = { hypr .. name .. ".lua", conf .. name .. ".lua" }
end

optional.link_files_when_binary({ "Hyprland", "hyprland" }, links)

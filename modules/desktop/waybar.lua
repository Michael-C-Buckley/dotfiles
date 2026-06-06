local optional = require("modules.lib.optional")

local dir = "configs/desktop/waybar"
optional.link_files_when_binary("waybar", {
  { dir .. "/config.jsonc", "~/.config/waybar/config.jsonc" },
  { dir .. "/style.css", "~/.config/waybar/style.css" },
})

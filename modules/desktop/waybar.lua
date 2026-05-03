local rb = require("rootbeer")
local dir = "configs/desktop/waybar"
rb.link_file(dir .. "/config.jsonc", "~/.config/waybar/config.jsonc")
rb.link_file(dir .. "/style.css", "~/.config/waybar/style.css")

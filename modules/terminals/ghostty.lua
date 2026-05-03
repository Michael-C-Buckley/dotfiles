local rb = require("rootbeer")
local dir = "configs/terminal/ghostty"
rb.link_file(dir .. "/config", "~/.config/ghostty/config")

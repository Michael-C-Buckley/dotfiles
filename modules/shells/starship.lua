local rb = require("rootbeer")
local dir = "configs/shells/starship"
rb.link_file(dir .. "/default.toml", "~/.config/starship.toml")

local rb = require("rootbeer")
local dir = "configs/terminal/kitty"
rb.link_file(dir .. "/kitty.conf", "~/.config/kitty/kitty.conf")

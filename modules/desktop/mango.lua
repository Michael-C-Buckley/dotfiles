local rb = require("rootbeer")
local dir = "configs/desktop/mango"
rb.link_file(dir .. "/config.conf", "~/.config/mango/config.conf")
rb.link_file(dir .. "/binds.conf", "~/.config/mango/binds.conf")
rb.link_file(dir .. "/noctalia.conf", "~/.config/mango/noctalia.conf")

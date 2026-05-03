local rb = require("rootbeer")
local dir = "configs/desktop/niri"
--rb.link_file("configs/niri/config.kdl", "~/.config/niri/config.kdl")
rb.link_file(dir .. "/binds.kdl", "~/.config/niri/binds.kdl")
rb.link_file(dir .. "/noctalia.kdl", "~/.config/niri/noctalia.kdl")

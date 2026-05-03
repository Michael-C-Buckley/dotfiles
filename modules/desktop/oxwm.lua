local rb = require("rootbeer")
local dir = "configs/desktop/oxwm"
rb.link_file(dir .. "/config.lua", "~/.config/oxwm/config.lua")
rb.link_file(dir .. "/binds.lua", "~/.config/oxwm/binds.lua")
rb.link_file(dir .. "/bar.lua", "~/.config/oxwm/bar.lua")
rb.link_file(dir .. "/colors.lua", "~/.config/oxwm/colors.lua")

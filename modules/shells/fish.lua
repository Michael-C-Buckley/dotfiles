local rb = require("rootbeer")
local dir = "configs/shells/fish/"
rb.link_file(dir .. "profile", "~/.profile")
rb.link_file(dir .. "config.fish", "~/.config/fish/config.fish")
rb.link_file(dir .. "functions/fcd.fish", "~/.config/fish/functions/fcd.fish")
rb.link_file(dir .. "functions/show.fish", "~/.config/fish/functions/show.fish")

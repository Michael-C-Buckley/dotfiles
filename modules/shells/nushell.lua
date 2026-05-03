local rb = require("rootbeer")
local dir = "configs/shells/nushell"
rb.link_file(dir .. "/config.nu", "~/.config/nushell/config.nu")
rb.link_file(dir .. "/git.nu", "~/.config/nushell/git.nu")
rb.link_file(dir .. "/starship.nu", "~/.config/nushell/starship.nu")
rb.link_file(dir .. "/prompt.nu", "~/.config/nushell/prompt.nu")

local rb = require("rootbeer")
local dir = "configs/shells/bash"
rb.link_file(dir .. "/bashrc", "~/.bashrc")
rb.link_file(dir .. "/bash_profile", "~/.bash_profile")

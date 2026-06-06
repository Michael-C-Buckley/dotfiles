local optional = require("modules.lib.optional")

local dir = "configs/shells/bash"
optional.link_files_when_binary("bash", {
  { dir .. "/bashrc", "~/.bashrc" },
  { dir .. "/bash_profile", "~/.bash_profile" },
})

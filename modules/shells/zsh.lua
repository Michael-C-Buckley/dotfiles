local optional = require("modules.lib.optional")

local dir = "configs/shells/zsh"
optional.link_files_when_binary("zsh", {
  { dir .. "/zshrc", "~/.zshrc" },
})

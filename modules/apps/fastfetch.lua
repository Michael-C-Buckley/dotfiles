local optional = require("modules.lib.optional")

optional.link_files_when_binary("fastfetch", {
  {
    "configs/terminal/fastfetch/linux.jsonc",
    "~/.config/fastfetch/config.jsonc",
  },
})

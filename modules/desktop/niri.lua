local optional = require("modules.lib.optional")

local dir = "configs/desktop/niri"
--rb.link_file("configs/niri/config.kdl", "~/.config/niri/config.kdl")
optional.link_files_when_binary("niri", {
  { dir .. "/binds.kdl", "~/.config/niri/binds.kdl" },
  { dir .. "/noctalia.kdl", "~/.config/niri/noctalia.kdl" },
})

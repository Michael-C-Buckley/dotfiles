local optional = require("modules.lib.optional")

local dir = "configs/shells/fish/"

optional.link_files_when_binary("fish", {
  { dir .. "profile", "~/.profile" },
  { dir .. "config.fish", "~/.config/fish/config.fish" },
  { dir .. "functions/fcd.fish", "~/.config/fish/functions/fcd.fish" },
  {
    dir .. "functions/fish_mode_prompt.fish",
    "~/.config/fish/functions/fish_mode_prompt.fish",
  },
  {
    dir .. "functions/fish_prompt.fish",
    "~/.config/fish/functions/fish_prompt.fish",
  },
  { dir .. "functions/show.fish", "~/.config/fish/functions/show.fish" },
})

local rb = require("rootbeer")

local function link(src, dst)
  rb.link_file("configs/editor/helix/" .. src, "~/.config/helix/" .. dst)
end

local function links(file)
  link(file, file)
end

links("config.toml")
links("languages.toml")
link("azen.toml", "themes/azen.toml")

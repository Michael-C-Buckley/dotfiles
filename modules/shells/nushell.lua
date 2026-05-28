local rb = require("rootbeer")

local function link_nu(filename)
  rb.link_file(
    "configs/shells/nushell/" .. filename,
    "~/.config/nushell/" .. filename
  )
end

link_nu("env.nu")
link_nu("config.nu")
link_nu("git.nu")
link_nu("starship.nu")
link_nu("prompt.nu")

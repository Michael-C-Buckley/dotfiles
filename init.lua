local rb = require("rootbeer")

rb.profile.define({
  strategy = "cli",
  profiles = {
    personal = {},
    work = {},
  },
})

require("modules.git")

local function host_import(hostname)
  require("hosts." .. hostname .. ".host")
end

if rb.host.os == "macos" then
  require("modules.terminals.ghostty")
  require("modules.apps.nvim")
  require("modules.brew")
end

if rb.host.os == "linux" then
  pcall(host_import, rb.host.hostname)
end

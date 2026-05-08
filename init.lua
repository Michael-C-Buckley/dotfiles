local rb = require("rootbeer")

rb.profile.define({
  strategy = "cli",
  profiles = {
    personal = {},
    work = {},
  },
})

require("modules.git")

function host_import(hostname)
  require("hosts." .. hostname .. ".host")
end

if rb.host.os == "macos" then
  require("modules.brew")
  require("modules.presets.base")
  require("modules.apps.nvim")
end

if rb.host.os == "linux" then
  pcall(host_import, rb.host.hostname)
end

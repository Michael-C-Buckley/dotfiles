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
  if not hostname then
    return false
  end

  local host_file = rb.source_dir .. "/hosts/" .. hostname .. "/host.lua"
  if not rb.is_file(host_file) then
    return false
  end

  require("hosts." .. hostname .. ".host")
  return true
end

if rb.host.os == "macos" then
  require("modules.terminals.ghostty")
  require("modules.apps.nvim")
  require("modules.brew")
  require("modules.shells.nushell")
end

if rb.host.os == "linux" then
  host_import(rb.host.hostname)
end

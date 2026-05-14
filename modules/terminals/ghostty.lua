local rb = require("rootbeer")
--local dir = "configs/terminal/ghostty"
--rb.link_file(dir .. "/config", "~/.config/ghostty/config")


local config = [[
cursor-color = #44A3A3
cursor-opacity = 0.6
font-family = Cascadia Code NF
background = #000000
keybind = performable:ctrl+shift+h=previous_tab
keybind = performable:ctrl+shift+l=next_tab
]]

if rb.host.os == "macos" then
  config = config .. [[
font-size = 14
font-thicken = true
font-thicken-strength = 155
command = /opt/homebrew/bin/fish
]]
else
  config = config .. [[
font-size = 11
]]
end

rb.file("~/.config/ghostty/config", config)

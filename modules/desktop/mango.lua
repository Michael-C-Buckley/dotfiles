local rb = require("rootbeer")
local dsktp = "configs/desktop"
local dir = dsktp .. "/mango"
local waybar = dir .. "/waybar"

rb.link_file(dir .. "/config.conf", "~/.config/mango/config.conf")
rb.link_file(dir .. "/binds.conf", "~/.config/mango/binds.conf")
--rb.link_file(dir .. "/noctalia.conf", "~/.config/mango/noctalia.conf")
rb.link_file(dir .. "/dms.conf", "~/.config/mango/dms.conf")
-- rb.link_file(dir .. "/waybar.conf", "~/.config/mango/waybar.conf")

rb.link_file(waybar .. "/config.jsonc", "~/.config/mango/waybar/config.jsonc")
rb.link_file(waybar .. "/style.css", "~/.config/mango/waybar/style.css")
rb.link_file(dsktp .. "/fuzzel/fuzzel.ini", "~/.config/fuzzel/fuzzel.ini")

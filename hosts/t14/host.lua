local rb = require("rootbeer")
require("modules.presets.linux")

-- Mango Host File
rb.link_file("hosts/t14/mango.conf", "~/.config/mango/host.conf")

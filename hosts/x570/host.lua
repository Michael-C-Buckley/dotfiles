local rb = require("rootbeer")
require("modules.presets.linux")

-- Mango Host File
rb.link_file("hosts/x570/mango.conf", "~/.config/mango/host.conf")

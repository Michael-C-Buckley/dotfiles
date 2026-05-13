local profile = require("rootbeer.profile")
local rb = require("rootbeer")

local apps = {"fastfetch", "zed", "helix"}
local shells = {"bash", "fish", "nushell", "starship", "zsh"}
local terminals = {"kitty", "ghostty"}

function import_items(family, dir)
    for i, v in ipairs(family) do
        require("modules." .. dir .. "." .. v)
    end
end

import_items(shells, "shells")
import_items(apps, "apps")
import_items(terminals, "terminals")

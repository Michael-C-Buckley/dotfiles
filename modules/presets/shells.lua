local profile = require("rootbeer.profile")
local rb = require("rootbeer")

local shells = { "bash", "fish", "nushell", "zsh" }

function import_items(family, dir)
  for i, v in ipairs(family) do
    require("modules." .. dir .. "." .. v)
  end
end

import_items(shells, "shells")

local ipc = "noctalia-shell ipc call "
local mainMod = "SUPER"

hl.on("hyprland.start", function()
  hl.exec_cmd("noctalia-shell ")
end)

hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(ipc .. "launcher toggle"))
hl.bind(mainMod .. " + ALT + Space", hl.dsp.exec_cmd(ipc .. " bar toggle"))
hl.bind(mainMod .. " + CTRL + L", hl.dsp.exec_cmd(ipc .. " lock lock"))

-- Main Config Entry Point

require("binds")
require("input")
require("lookfeel")
require("windows")

-- Host files may or may not exist
-- Prevents issues but hides actual errors in the file
pcall(require, "host")
pcall(require, "noctalia")

hl.env("XCURSOR_SIZE", "28")
hl.env("HYPRCURSOR_SIZE", "28")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("KDE_PLATFORM_THEME", "qt6ct")

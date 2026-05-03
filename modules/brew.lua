local brew = require("rootbeer.brew")
local profile = require("rootbeer.profile")

local commone_formulae = {
    "gnupg",
    "lima",
    "openssh",
    "sops",
    "age",
    "age-plugin-se",
    "age-plugin-yubikey",
    "openssh",
    "fastfetch",
    "direnv"
}

local common_casks = {
    "glide-browser",
    "ghostty",
    "zed",
    "secretive",
    "kitty",
    "font-lilex",
    "font-ibm-plex-mono",
    "font-ibm-plex-sans",
    "font-cascadia-code",
}

local extra_casks = profile.select({
    personal = {
    },
    work = {
    },
})

local casks = table.move(common_casks, 1, #common_casks, 1, extra_casks)

brew.config({
    formulae = table.move(commone_formulae, 1, #commone_formulae, 1, {
        "xz",
        "fd",
        "curl",
        "fzf",
        "git",
        "git-delta",
        "openssh",
        "jq",
        "make",
        "opencode",
        "ripgrep",
        "rsync",
        "telnet",
        "wget",
        "yq",
        "yazi",
        "iproute2mac",
        "helix",
        "nushell"
    }),
    casks = casks,
})

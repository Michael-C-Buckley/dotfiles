local rb = require("rootbeer")
local git = require("rootbeer.git")
local profile = require("rootbeer.profile")

git.config({
    user = {
        name = "Michael Buckley",
        email = profile.select({
            default = "michaelcbuckley@proton.me",
            work = rb.host.user .. "@cisco.com",
        }),
    },
    advice = { defaultBranchName = false },
    editor = "nvim",
    pager = "delta",
    signing = {
        key = "~/.ssh/git_signing.pub",
        format = "ssh",
    },
    pull_rebase = true,
    merge_conflictstyle = "zdiff3",
    ignores = {
        ".DS_Store",
        ".AppleDouble",
        ".LSOverride",
        "Icon",
        "._*",
        ".DocumentRevisions-V100",
        ".fseventsd",
        ".Spotlight-V100",
        ".TemporaryItems",
        ".Trashes",
        ".VolumeIcon.icns",
        ".com.apple.timemachine.donotpresent",
        ".AppleDB",
        ".AppleDesktop",
        "Network Trash Folder",
        "Temporary Items",
        ".apdisk",
        "*~",
        ".fuse_hidden*",
        ".directory",
        ".Trash-*",
        ".nfs*",
    },
    extra = {
        delta = {
            ["side-by-side"] = true,
            ["line-numbers"] = true,
            ["zero-style"] = "dim syntax",
            navigate = true,
        },
        interactive = { diffFilter = "delta --color-only" },
        http = { postBuffer = 157286400 },
    },
})

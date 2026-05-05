vim.pack.add({
    "https://github.com/saghen/blink.lib",
    { src = "https://github.com/Saghen/blink.cmp", version = vim.version.range("^1.10") },
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/rafamadriz/friendly-snippets",
})

vim.api.nvim_create_autocmd("InsertEnter", {
    once = true,
    callback = function()
        require("blink.cmp").setup({
            snippets = { preset = "luasnip" },
            fuzzy = { implementation = "lua" },
        })
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
})

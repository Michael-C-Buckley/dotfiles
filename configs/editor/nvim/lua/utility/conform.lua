vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    once = true,
    callback = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                nix = { "alejandra" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end,
})

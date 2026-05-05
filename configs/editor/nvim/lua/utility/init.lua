vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/folke/todo-comments.nvim",
})

require("utility.autocmds")
require("utility.blink")
require("utility.conform")
require("utility.diagnostics")
require("utility.oil")
require("utility.terminal")
require("utility.vim")
require("utility.snacks")

-- Lazy load gitsigns and to-do
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	once = true,
	callback = function()
		require("gitsigns").setup()
		require("todo-comments").setup()
	end,
})

-- Load DAP only for debuggable filetypes
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "python", "lua", "c", "cpp", "rust" }, -- your targets
	once = true,
	callback = function()
		require("utility.dap_config")
	end,
})

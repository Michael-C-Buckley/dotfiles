if vim.g.vscode then
  -- If I'm running this in vscode then use this config
  require("base.vscode_keymaps")
else
  -- Everything else is the normal flow
  require("ui.themes")
  vim.pack.add({ "https://github.com/Shatur/neovim-ayu" })
  vim.pack.add({ "https://github.com/slugbyte/lackluster.nvim" })
  require("lackluster")
  require("ayu")

  -- Customized and super minimal version of quiet with just a tiny bit of useful highlighting
  vim.cmd.colorscheme("quiet")

  -- === Options ===
  vim.diagnostic.config({ virtual_lines = { current_line = true } })
  vim.opt.laststatus = 3
  vim.opt.statusline = "%<%{expand('%:~')}(%(%l:%v%))"
      .. " %{exists('b:git_branch') ? b:git_branch : ''}"
      .. " %h%w%{&modified ?  '[MODIFIED]' : ''}%r"
      .. " %=Rune=%B"
      .. " Byte_Index=%o"
      .. " %q"
      .. " %P"

  require("base")
  require("languages")
  require("utility")
  require("ui.mini")
end

-- If I'm running this in vscode then use this config
if vim.g.vscode then
  require("base.vscode_keymaps")
  -- Everything else is the normal flow
else
  require("ui.themes")
  vim.pack.add({ "https://github.com/Shatur/neovim-ayu" })
  vim.pack.add({ "https://github.com/slugbyte/lackluster.nvim" })
  require("lackluster")
  require("ayu")

  -- vim.cmd.colorscheme("quiet")
  -- vim.cmd.colorscheme("lackluster")
  -- vim.cmd.colorscheme("default")

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
  require("utility")
  require("languages")
  require("ui.mini")
end

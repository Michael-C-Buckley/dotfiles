-- === Colorscheme ===
local palette = {
  main = {
    ["primary"] = "#DFE0DC",
    ["primary_dark"] = "#888888",
    ["accent"] = "#F6C177",
    ["red"] = "#EB6F92",
    ["blue"] = "#9CCFD8",
  },
}

palette = palette.main

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = { "quiet", "lackluster*" }, -- or a specific scheme name like "gruvbox"
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { fg = palette.primary })

    vim.api.nvim_set_hl(0, "Comment", { fg = palette.primary_dark })
    vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })
    vim.api.nvim_set_hl(0, "rustCommentLineDoc", { link = "Comment" })
    vim.api.nvim_set_hl(0, "LineNr", { link = "Comment" })
    vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
    vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })

    vim.api.nvim_set_hl(0, "Directory", { fg = palette.accent })
    vim.api.nvim_set_hl(0, "String", { fg = palette.accent })
    vim.api.nvim_set_hl(0, "@string", { link = "String" })
    vim.api.nvim_set_hl(0, "TODO", { fg = palette.red })
    vim.api.nvim_set_hl(0, "MatchParen", { fg = palette.red })

    vim.api.nvim_set_hl(
      0,
      "YankSystemClipboard",
      { bg = palette.red, fg = "#000000" }
    )

    vim.api.nvim_set_hl(0, "Visual", { bg = "#333333" })
    vim.api.nvim_set_hl(0, "QuickFixLine", { link = "Visual" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#0A0A0A" })
    vim.api.nvim_set_hl(0, "StatusLine", { bg = "#111111" })
    vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#222222" })

    vim.api.nvim_set_hl(
      0,
      "IncSearch",
      { bg = palette.primary, fg = "#000000" }
    )
    vim.api.nvim_set_hl(
      0,
      "Substitute",
      { bg = palette.primary, fg = "#000000" }
    )
  end,
})

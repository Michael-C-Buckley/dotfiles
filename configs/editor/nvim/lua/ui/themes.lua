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

function hl(name, set)
  vim.api.nvim_set_hl(0, name, set)
end

palette = palette.main

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = { "quiet" },
  callback = function()
    hl("Normal", { fg = palette.primary })

    hl("Comment", { fg = palette.primary_dark })
    hl("@comment", { link = "Comment" })
    hl("rustCommentLineDoc", { link = "Comment" })
    hl("LineNr", { link = "Comment" })
    hl("LineNrAbove", { link = "Comment" })
    hl("LineNrBelow", { link = "Comment" })

    hl("Directory", { fg = palette.accent })
    hl("String", { fg = palette.accent })
    hl("@string", { link = "String" })
    hl("TODO", { fg = palette.red })
    hl("MatchParen", { fg = palette.red })

    -- hl("MiniTablineCurrent", { fg = palette.
    --- - `MiniTablineVisible` - buffer is visible (displayed in some window).
    --- - `MiniTablineHidden` - buffer is hidden (not displayed).
    --- - `MiniTablineModifiedCurrent` - buffer is modified and current.
    --- - `MiniTablineModifiedVisible` - buffer is modified and visible.
    --- - `MiniTablineModifiedHidden` - buffer is modified and hidden.

    vim.api.nvim_set_hl(
      0,
      "YankSystemClipboard",
      { bg = palette.red, fg = "#000000" }
    )

    hl("Visual", { bg = "#333333" })
    hl("QuickFixLine", { link = "Visual" })
    hl("NormalFloat", { bg = "#0A0A0A" })
    hl("StatusLine", { bg = "#111111" })
    hl("ColorColumn", { bg = "#222222" })

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

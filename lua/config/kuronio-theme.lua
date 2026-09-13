local M = {}

local palette = {
  accent = "#4d4188", -- primary Kuronio violet (muted, not neon)
  accent_soft = "#5f5499", -- softer violet, for less prominent elements
  bg_deep = "#0d0b12", -- near-black with a faint violet undertone
}

function M.apply()
  local hl = vim.api.nvim_set_hl

  -- Dashboard header: the one place Kuronio should be clearly visible
  hl(0, "SnacksDashboardHeader", { fg = palette.accent_soft })

  -- Current line number: a subtle daily-use accent, doesn't compete
  -- with kanagawa's diagnostic/syntax colors
  hl(0, "CursorLineNr", { fg = palette.accent, bold = true })

  -- Floating window borders: tinted just enough to feel intentional,
  -- dark enough to stay in kanagawa's tonal range
  hl(0, "FloatBorder", { fg = palette.accent_soft, bg = "NONE" })

  -- Popup menu selection: uses the accent as background, but kept
  -- dark/muted rather than a bright violet block
  hl(0, "PmenuSel", { fg = "#dcd7ba", bg = palette.bg_deep, bold = true })
end

return M

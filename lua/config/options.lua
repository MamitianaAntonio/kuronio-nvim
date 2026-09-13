-- ~/.config/nvim/lua/config/options.lua

-- Numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2
vim.opt.signcolumn = "yes:1"
vim.opt.cursorline = false

vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.api.nvim_set_hl(0, "Visual", {
  bg = "#2a2a2a",
  bold = false,
})

-- winbar
vim.opt.winbar = "%=%m %f"

-- LSP
vim.api.nvim_set_hl(0, "LspInlayHint", {
  italic = false,
  bold = false,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.lsp.semantic_tokens.enable(false, {
      bufnr = args.buf,
    })
  end,
})

vim.lsp.inlay_hint.enable(false)

-- Indentation
vim.opt.expandtab = true
vim.opt.smartindent = true

-- UI
vim.opt.termguicolors = true
vim.opt.showmode = false

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Performance
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- Clipboard
vim.opt.clipboard = "unnamedplus"

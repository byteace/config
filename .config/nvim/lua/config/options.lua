vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "#666666" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#bbbbbb", bold = true })

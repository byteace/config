-- General UI highlights
vim.api.nvim_set_hl(0, "LineNr", { fg = "#888888" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#bbbbbb", bold = true })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#222222" })

-- DAP (Debug Adapter Protocol) highlights
vim.api.nvim_set_hl(0, "DapUINormal", { bg = "#1a1a1a" })
vim.api.nvim_set_hl(0, "DapUICurrentFrame", { fg = "#ffffff", bg = "#3a3a3a", bold = true })
vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { fg = "#ff5555", bold = true })
vim.api.nvim_set_hl(0, "DapStopped", { fg = "#ffffff", bg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "DapCurrentLine", { bg = "#3a3a3a" })
vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#f87070", bold = true })

-- DAP signs
vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapCurrentLine", numhl = "" })

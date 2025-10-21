vim.g.mapleader = ";"
vim.g.maplocalleader = "\\"

vim.keymap.set("c", "<Down>", "<C-n>", { noremap = true })
vim.keymap.set("c", "<Up>", "<C-p>", { noremap = true })

vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "LSP: Go to definition" })
vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", { desc = "LSP: Go to implementation" })
vim.keymap.set("n", "<leader>di", function() require("dap.ui.widgets").hover() end, { desc = "Inspect variable" })


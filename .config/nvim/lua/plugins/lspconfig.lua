return {
  "neovim/nvim-lspconfig",
<<<<<<< HEAD
<<<<<<< HEAD
  dependencies = { "williamboman/mason-lspconfig.nvim" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.config('lua_ls', {})
    vim.lsp.config('intelephense', {
      settings = {
        intelephense = { files = { maxSize = 5000000 } }
      }
    })

    vim.lsp.enable({ 'lua_ls', 'intelephense' })
=======
  dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
=======
  dependencies = { "williamboman/mason-lspconfig.nvim" },
>>>>>>> 30edbea (sdf)
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    vim.lsp.config("*", { capabilities = capabilities })

    vim.lsp.config('lua_ls', {})
    vim.lsp.config('intelephense', {
      settings = {
        intelephense = { files = { maxSize = 5000000 } }
      }
    })
<<<<<<< HEAD
>>>>>>> 455a59d (lazyvim)
=======

    vim.lsp.enable({ 'lua_ls', 'intelephense' })
>>>>>>> 30edbea (sdf)
  end,
}

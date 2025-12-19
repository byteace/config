return {
  "neovim/nvim-lspconfig",
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
  end
}
  
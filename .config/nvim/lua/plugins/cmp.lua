return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      sources = { { name = "nvim_lsp" } },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
    })
    vim.lsp.config("lua_ls", {
      capabilities = require("cmp_nvim_lsp").default_capabilities(),
      settings = {
        Lua = {
          runtime = { version = "LuaJIT" },
          diagnostics = { globals = { "vim" } },
          workspace = { library = vim.api.nvim_get_runtime_file("", true) },
          telemetry = { enable = false },
        },
      },
    })
  end,
}

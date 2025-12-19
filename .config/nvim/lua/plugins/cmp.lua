return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      sources = { { name = "nvim_lsp" } },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<TAB>"] = cmp.mapping.confirm({ select = true }),
        ["<M-Down>"] = cmp.mapping(cmp.mapping.select_next_item({ count = 10 }), { "i", "c" }),
        ["<M-Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ count = 10 }), { "i", "c" }),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
    })
  end,
}

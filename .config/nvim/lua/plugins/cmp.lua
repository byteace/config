return {
  "hrsh7th/nvim-cmp",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  config = function()
    local cmp = require("cmp")
    cmp.setup({
      sources = { { name = "nvim_lsp" } },
      mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
<<<<<<< HEAD
<<<<<<< HEAD
        ["<TAB>"] = cmp.mapping.confirm({ select = true }),
        ["<M-Down>"] = cmp.mapping(cmp.mapping.select_next_item({ count = 10 }), { "i", "c" }),
        ["<M-Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ count = 10 }), { "i", "c" }),
      }),
    })
=======
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
>>>>>>> 455a59d (lazyvim)
=======
        ["<TAB>"] = cmp.mapping.confirm({ select = true }),
        ["<M-Down>"] = cmp.mapping(cmp.mapping.select_next_item({ count = 10 }), { "i", "c" }),
        ["<M-Up>"] = cmp.mapping(cmp.mapping.select_prev_item({ count = 10 }), { "i", "c" }),
      }),
    })
>>>>>>> 30edbea (sdf)
  end,
}

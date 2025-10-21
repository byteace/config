return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason-lspconfig").setup({
<<<<<<< HEAD
<<<<<<< HEAD
      ensure_installed = { "intelephense", "lua_ls" },
=======
      ensure_installed = { "lua_ls", "intelephense" },
      automatic_enable = true,
>>>>>>> 55c2ff4 (vim)
=======
      ensure_installed = { "intelephense", "lua_ls" },
>>>>>>> 30edbea (sdf)
    })
  end,
}

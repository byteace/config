return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "php", "html" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      },
    })
  end,
}

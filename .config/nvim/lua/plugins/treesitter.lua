return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  lazy = false,
  build = ":TSUpdate",
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 55c2ff4 (vim)
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = { "lua", "php", "html" },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true
      },
    })
  end,
<<<<<<< HEAD
=======
>>>>>>> 455a59d (lazyvim)
=======
>>>>>>> 55c2ff4 (vim)
}

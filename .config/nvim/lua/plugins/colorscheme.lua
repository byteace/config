return {
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 30edbea (sdf)
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
      })
    end,
  },
  {
    "Mofiqul/vscode.nvim",
    name = "vscode",
    priority = 999,
    config = function()
      require("vscode").setup({
        style = "dark",
        color_overrides = {
          vscBack = "#1f2128",
        },
        group_overrides = {
          Comment = { fg = "#5c6370", italic = true },
          CursorLine = { bg = "#2d3038" },
        },
      })
    end,
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github_dark",
    lazy = false,
    priority = 998,
    config = function()
      require("github-theme").setup({})
<<<<<<< HEAD
      vim.cmd.colorscheme "github_dark_default"
    end,
  },
=======
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({ flavour = "mocha" }) -- or latte, frappe, macchiato
  end,
>>>>>>> 55c2ff4 (vim)
=======
      vim.cmd.colorscheme "github_dark"
    end,
  },
>>>>>>> 30edbea (sdf)
}

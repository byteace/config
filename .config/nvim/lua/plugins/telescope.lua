return {
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "nvim-telescope/telescope.nvim",
<<<<<<< HEAD
    lazy = true,
=======
>>>>>>> 30edbea (sdf)
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      -- Load fzf for speed
      telescope.load_extension("fzf")

      -- Default setup with performance tweaks
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "vendor/", "node_modules/", "%.git/" },
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
        },
        pickers = {
          find_files = {
            hidden = true,
            no_ignore = false,
          },
        },
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>fa", builtin.find_files, { desc = "Find all files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })

      -- PHP-only files
      vim.keymap.set("n", "<leader>fp", function()
        builtin.find_files({
          prompt_title = "PHP Files",
          find_command = { "rg", "--files", "--type", "php", "--hidden", "--glob", "!.git" },
        })
      end, { desc = "Find PHP files" })

      -- Grep only in PHP
      vim.keymap.set("n", "<leader>gp", function()
        builtin.live_grep({
          prompt_title = "Grep in PHP",
          glob_pattern = "*.php",
        })
      end, { desc = "Grep in PHP files" })

      -- Project search (fast, cached)
      vim.keymap.set("n", "<leader>ff", function()
        builtin.git_files({ show_untracked = true })
      end, { desc = "Find in git project" })
    end,
  },
}

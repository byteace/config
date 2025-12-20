return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

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
      vim.keymap.set("n", "<leader>ff", builtin.git_files, { desc = "Find in git project" })

      -- PHP-only files keymap
      vim.keymap.set("n", "<leader>fp", function()
        builtin.find_files({
          prompt_title = "PHP Files",
          find_command = { "rg", "--files", "--type", "php", "--hidden", "--glob", "!.git" },
        })
      end, { desc = "Find PHP files" })

      -- Grep only in PHP keymap  
      vim.keymap.set("n", "<leader>gp", function()
        builtin.live_grep({
          prompt_title = "Grep in PHP",
          glob_pattern = "*.php",
        })
      end, { desc = "Grep in PHP files" })
    end,
  },
}

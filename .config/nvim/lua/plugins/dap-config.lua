-- plugins/dap-config.lua
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      layouts = {
        {
          elements = { "scopes", "breakpoints", "stacks", "watches" },
          size = 40,
          position = "left",
        },
        {
          elements = { "repl", "console" },
          size = 10,
          position = "bottom",
        },
      },
      floating = { border = "rounded" },
    })

    dap.listeners.after.event_initialized["dapui"] = dapui.open
    dap.listeners.before.event_terminated["dapui"] = dapui.close
    dap.listeners.before.event_exited["dapui"]    = dapui.close

    dap.adapters.php = {
      type = "executable",
      command = "node",
      args = {
        vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
      },
    }

    dap.configurations.php = {
      {
        name = "Listen for Xdebug",
        type = "php",
        request = "launch",
        port = 9003,
        pathMappings = {
          ["/srv/www/klicktipp/htdocs"] = "${workspaceFolder}",
        },
      },
    }

    vim.keymap.set("n", "<F9>", dap.continue, { desc = "DAP: Start/Continue" })
    vim.keymap.set("n", "<F10>", dap.step_over)
    vim.keymap.set("n", "<F11>", dap.step_into)
    vim.keymap.set("n", "<F12>", dap.step_out)
    vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle breakpoint" })

    vim.keymap.set("n", "<F5>", function()
      local configs = require("dap").configurations[vim.bo.filetype] or {}
      if #configs > 0 then
        require("dap").run(configs[1])
      else
        require("dap").continue()
      end
    end, { desc = "DAP: Run first config or continue" })

    vim.keymap.set("n", "<F6>", function()
      require("dapui").close()
    end, { desc = "DAP: Close UI" })

    -- Highlight current line in DAP UI
    vim.api.nvim_set_hl(0, "DapUINormal", { bg = "#1a1a1a" })
    vim.api.nvim_set_hl(0, "DapUICurrentFrame", { fg = "#ffffff", bg = "#3a3a3a", bold = true })
    vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { fg = "#ff5555", bold = true })

    -- Make arrow white
    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapCurrentLine", numhl = "" })
    vim.api.nvim_set_hl(0, "DapStopped", { fg = "#ffffff", bg = "#3a3a3a" })
    vim.api.nvim_set_hl(0, "DapCurrentLine", { bg = "#3a3a3a" })
    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#f87070", bold = true })


    vim.api.nvim_create_autocmd("FileType", {
        pattern = "dap-float",
        callback = function()
            vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>close!<CR>", { noremap = true, silent = true })
        end
    })
  end,
}

-- plugins/dap-config.lua
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    dap.defaults.fallback.auto_open = true
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
          ["/srv/www/klicktipp/htdocs"] = "${workspaceFolder}/drupal",
        },
      },
    }

    -- Go/Delve adapter configuration (connects to remote Delve server)
    dap.adapters.go = {
      type = "server",
      port = 40040,  -- Port for ai-email-generator-grpc-server
      host = "localhost",
    }

    -- Go DAP configurations
    dap.configurations.go = {
      {
        name = "Connect to AI Email Generator gRPC Server",
        type = "go",
        request = "attach",
        mode = "remote",
        substitutePath = {
          {
            from = "${workspaceFolder}/services/ai-email-generator",
            to = "/Users/ops/src/klick-tipp/services/ai-email-generator",
          },
        },
        port = 40040,
        host = "localhost",
        showLog = true,
        trace = "verbose",
      },
      {
        name = "Connect to AI Email Generator Worker",
        type = "go",
        request = "attach",
        mode = "remote",
        substitutePath = {
          {
            from = "${workspaceFolder}/services/ai-email-generator",
            to = "/Users/ops/src/klick-tipp/services/ai-email-generator",
          },
        },
        port = 40041,
        host = "localhost",
        showLog = true,
        trace = "verbose",
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

    vim.api.nvim_create_autocmd("FileType", {
        pattern = "dap-float",
        callback = function()
            vim.api.nvim_buf_set_keymap(0, "n", "q", "<cmd>close!<CR>", { noremap = true, silent = true })
        end
    })
  end,
}

return {
  { 'mfussenegger/nvim-dap' },
  { 'jay-babu/mason-nvim-dap.nvim' },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap, dapui = require("dap"), require("dapui")
      dapui.setup()

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      -- rust
      dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb",
      }
      dap.configurations.rust = {
        {
          -- If you get an "Operation not permitted" error using this, try disabling YAMA:
          --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
          name = "Attach to process",
          type = 'codelldb',
          request = 'attach',
          pid = require('dap.utils').pick_process,
          args = {},
        }
      }

      -- keybindings
      vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
    end
  }
}

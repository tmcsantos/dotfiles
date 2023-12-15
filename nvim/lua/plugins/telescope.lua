return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    brach = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")

      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            "secret.d/*",
            "%.pem",
          },
        }
      })

      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

      vim.keymap.set('n', '<C-p>', function()
          vim.fn.system('git rev-parse --is-inside-work-tree')
          if vim.v.shell_error == 0 then
              builtin.git_files({})
          else
              builtin.find_files({ hidden = true })
          end
  end, {})
    end
  },

  -- fzf
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

  { 'nvim-telescope/telescope-ui-select.nvim' },

}

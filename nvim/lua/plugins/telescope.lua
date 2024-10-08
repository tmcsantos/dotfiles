return {
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            "secret.d/*",
            "%.pem",
          },
          mappings = {
            n = {
              ["dd"] = actions.delete_buffer,
            },
            i = {
              -- ["<ESC>"] = actions.close,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
            },
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
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      local fzf_opts = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      }
      require("telescope").setup({
        pickers = {
          -- Manually set sorter, for some reason not picked up automatically
          -- Ref: https://github.com/nvim-telescope/telescope.nvim/issues/2104#issuecomment-1223790155
          lsp_dynamic_workspace_symbols = {
            sorter = require("telescope").extensions.fzf.native_fzf_sorter(fzf_opts),
          },
        },
        extensions = {
          fzf = fzf_opts
        },
      })
      require("telescope").load_extension("fzf")
    end
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },

}

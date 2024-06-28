return {
  -- {
  --   "nvim-neo-tree/neo-tree.nvim",
  --   -- branch = "v3.x",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
  --     "MunifTanjim/nui.nvim",
  --   },
  --   config = function()
  --     vim.keymap.set("n", "<leader>pv", ":Neotree filesystem float toggle<CR>", {})
  --   end,
  -- },

  {
    "stevearc/oil.nvim",
    opts = {},
    -- enabled = false,
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local oil = require("oil")
      oil.setup({
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-enter>"] = "actions.select_vsplit",
          ["<C-h>"] = "actions.select_split",
          ["<C-t>"] = "actions.select_tab",
          ["<C-p>"] = "actions.preview",
          ["<esc>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = "actions.tcd",
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        view_options = {
          -- Show files and directories that start with "."
          show_hidden = true,
        },
      })
      vim.keymap.set("n", "<leader>pv", oil.toggle_float, {})
    end,
  },
}

return {
  -- gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        -- transparent_mode = true,
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme "gruvbox"
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_background = 'soft'
      -- vim.g.gruvbox_material_transparent_background = 2
      vim.cmd.colorscheme "gruvbox-material"
    end
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      -- styles = {
      --   keywords = { "bold" },
      --   functions = { "italic" },
      -- },
      -- transparent_background = true,
      integrations = {
        gitsigns = true,
        mason = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
        neotree = true,
        -- noice = true,
        lsp_trouble = true,
        telescope = true,
        treesitter = true,
        treesitter_context = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme "catppuccin"
    end
  },

  -- tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = true,
    priority = 1000,
    opts = {
      style = "moon",
      -- transparent = true,
      lualine_bold = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme "tokyonight"
    end
  },
}

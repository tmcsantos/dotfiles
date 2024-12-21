function ColorMyPencils(color)
  color = color or "gruvbox"
  vim.cmd.colorscheme(color)
end

return {
  -- gruvbox
  {
    "luisiacc/gruvbox-baby",
    priority = 1000,
    config = function()
      vim.g.gruvbox_baby_background_color = "dark"
      -- vim.cmd.colorscheme "gruvbox-baby"
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    -- lazy = false,
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        underline = true,
        bold = true,
        contrast = "hard",
        -- transparent_mode = true,
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme "gruvbox"
    end,
  },
  -- rosé pine
  -- {
  --   "rose-pine/neovim",
  --   priority = 1000,
  --   name = "rose-pine",
  --   -- lazy = true,
  --   config = function()
  --     require("rose-pine").setup({
  --       disable_background = false,
  --     })
  --     -- vim.cmd.colorscheme "rose-pine-moon"
  --   end
  -- },
  -- -- catppuccin
  -- {
  --   "catppuccin/nvim",
  --   -- lazy = true,
  --   name = "catppuccin",
  --   priority = 1000,
  --   opts = {
  --     flavour = "macchiato", -- latte, frappe, macchiato, mocha
  --     -- styles = {
  --     --   keywords = { "bold" },
  --     --   functions = { "italic" },
  --     -- },
  --     -- transparent_background = true,
  --     integrations = {
  --       cmp = true,
  --       gitsigns = true,
  --       harpoon = true,
  --       mason = true,
  --       native_lsp = {
  --         enabled = true,
  --         underlines = {
  --           errors = { "undercurl" },
  --           hints = { "undercurl" },
  --           warnings = { "undercurl" },
  --           information = { "undercurl" },
  --         },
  --       },
  --       neotree = true,
  --       -- noice = true,
  --       lsp_trouble = true,
  --       telescope = true,
  --       treesitter = true,
  --       treesitter_context = true,
  --     },
  --   },
  --   config = function(_, opts)
  --     require("catppuccin").setup(opts)
  --     -- vim.cmd.colorscheme "catppuccin"
  --   end
  -- },
  --
  -- -- tokyonight
  -- {
  --   "folke/tokyonight.nvim",
  --   -- lazy = true,
  --   priority = 1000,
  --   opts = {
  --     style = "moon",
  --     -- transparent = true,
  --     lualine_bold = true,
  --   },
  --   config = function(_, opts)
  --     require("tokyonight").setup(opts)
  --     -- vim.cmd.colorscheme "tokyonight"
  --   end
  -- },
}

return {
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
        transparent_mode = false,
        palette_overrides = {
          dark0_hard = "#151718",
        },
      })
      vim.o.background = "dark"
      vim.cmd.colorscheme "gruvbox"
    end,
  },
}

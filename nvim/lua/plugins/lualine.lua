return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("lualine").setup({
      options = {
        -- theme = "catppuccin",
        -- theme = "gruvbox",
        theme = "auto",
        icons_enabled = true,
      },
      sections = {
        lualine_c = {
          {
            'filename',
            file_status = true,
            path = 1,
          }
        },
      },
    })
  end
}

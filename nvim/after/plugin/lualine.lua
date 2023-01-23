-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- theme = 'tokyonight',
    component_separators = '|',
    section_separators = '',
  },
}

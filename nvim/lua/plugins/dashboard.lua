return {
  'nvimdev/dashboard-nvim',
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
        week_header = { enable = true },
        shortcut = {
          {
            icon = '󰒲 ',
            icon_hl = '@variable',
            desc = 'Lazy',
            group = '@property',
            action = 'Lazy',
            key = 'l',
          },
          {
            icon = '󱌣 ',
            icon_hl = '@variable',
            desc = 'Mason',
            group = '@property',
            action = 'Mason',
            key = 'm',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = '@property',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Quit',
            group = 'Label',
            action = 'q',
            key = 'q',
          },
        },
      },
    }
  end,
};

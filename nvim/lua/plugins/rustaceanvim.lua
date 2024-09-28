return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false,   -- This plugin is already lazy
  init = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {
        float_win_config = {
          border = "rounded",
        },
      },
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            checkOnSave = false,
            check = {
              command = "clippy"
            }
          }
        }
      }
    }
  end,
}

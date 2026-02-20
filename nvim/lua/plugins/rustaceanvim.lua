return {
  "mrcjkb/rustaceanvim",
  enabled = true,
  version = "^7",
  lazy = false, -- This plugin is already lazy
  init = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {
        enable_clippy = true,
        float_win_config = {
          border = "rounded",
        },
      },
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            files = {
              excludeDirs = {
                ".cargo",
                ".direnv",
                ".git",
                "node_modules",
                "target",
              },
            },
            checkOnSave = false,
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
              }
            },
            check = {
              command = "check",
              workspace = false,
            },
            -- check = {
            --   -- command = "clippy",
            --   workspace = true,
            --   extraArgs = {
            --     "--no-deps",
            --   },
            -- },
          },
        },
      },
      -- DAP configuration
      dap = {

      },
    }
  end,
}

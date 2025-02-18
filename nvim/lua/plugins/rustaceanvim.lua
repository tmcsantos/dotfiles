return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false,   -- This plugin is already lazy
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
            cargo = {
              allFeatures = true,
            },
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
            -- check = {
            --   command = "clippy",
            --   -- workspace = true,
            --   extraArgs = {
            --     "--no-deps",
            --   },
            --   -- features = "all",
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

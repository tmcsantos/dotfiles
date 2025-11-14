return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      default_format_opts = {
        async = true,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = function(bufnr)
          if conform.get_formatter_info("ruff_format", bufnr).available then
            return { "ruff_fix", "ruff_format" }
          else
            return { "isort", "yapf" }
          end
        end,
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        sh = { "shellharden", lsp_format = "last" },
        json = { "jq" },
        proto = { "buf" },
        toml = { "taplo" },
      },
      -- formatters = {
      --   taplo = {
      --     -- Adds environment args to the taplo formatter
      --     env = function(client, bufnr)
      --       return { TAPLO_CONFIG = vim.fn.expand("$HOME/dotfiles/taplo.toml") }
      --     end
      --   }
      -- },
    })
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format()
    end)
  end,
}

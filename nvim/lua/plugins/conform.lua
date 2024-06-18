return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = function(bufnr)
          if conform.get_formatter_info("ruff_format", bufnr).available then
            return { "isort", "ruff_format", "isort" }
          else
            return { "isort", "yapf" }
          end
        end,
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({ async = true, lsp_fallback = true })
    end)
  end,
}

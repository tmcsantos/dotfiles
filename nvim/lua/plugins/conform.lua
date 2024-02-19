return {
  "stevearc/conform.nvim",
  config = function()
    local conform = require("conform")
    conform.setup({
      formatters_by_ft = {
        -- Conform will run multiple formatters sequentially
        python = function(bufnr)
          if conform.get_formatter_info("ruff_format", bufnr).available then
            return { "isort", "ruff_format" }
          else
            return { "isort", "yapf" }
          end
        end,
      },
    })
    vim.keymap.set("n", "<leader>f", function()
      conform.format({ async = true, lsp_fallback = true })
    end)
  end
}

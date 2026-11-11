local function system_clang_format()
  local mason_bin = vim.fs.joinpath(vim.fn.stdpath("data"), "mason", "bin")
  for _, dir in ipairs(vim.split(vim.env.PATH, ":", { plain = true })) do
    if dir ~= mason_bin and vim.fn.executable(dir .. "/clang-format") == 1 then
      return dir .. "/clang-format"
    end
  end
  return "clang-format"
end

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
        c = { "clang_format" },
        cpp = { "clang_format" },
        go = { "goimports", "gofmt" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        html = { "prettierd", "prettier", stop_after_first = true },
        sh = { "shellharden", "shfmt" },
        json = { "jq" },
        proto = { "buf" },
        toml = { "taplo" },
        yaml = { "yamlfmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci", "-bn", "-kp" },
        },
        clang_format = {
          command = function(self, ctx)
            -- A per-project override: .clang-format-bin containing a binary path
            local marker = vim.fs.find(".clang-format-bin", {
              upward = true,
              path = ctx.dirname,
              stop = vim.env.HOME,
            })[1]
            if marker then
              return vim.trim(vim.fn.readfile(marker)[1])
            end
            return system_clang_format()
          end,
        },
        --   taplo = {
        --     -- Adds environment args to the taplo formatter
        --     env = function(client, bufnr)
        --       return { TAPLO_CONFIG = vim.fn.expand("$HOME/dotfiles/taplo.toml") }
        --     end
        --   }
      },
    })
    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format()
    end)
  end,
}

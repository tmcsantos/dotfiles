return {
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>ll", "<cmd>LspLog<cr>",              desc = "Lsp Log" },
      { "<leader>li", "<cmd>checkhealth vim.lsp<cr>", desc = "Lsp Info" },
      { "<leader>lr", "<cmd>lsp restart<cr>",         desc = "Lsp Restart" },
    },
    dependencies = {
      {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
        config = false,
        dependencies = { "nvim-lspconfig" },
      },
      { "folke/lazydev.nvim", opts = {} },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local opts = { remap = false, silent = true, noremap = true }

      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
      -- vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts) -- changed for tmux nav
      -- vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts) -- changed for tmux nav

      vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
      vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
      vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
      vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, opts)
      vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts)
      vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols, opts)

      vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)

      -- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
    end,
  },

  -- mason
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "williamboman/mason.nvim",
        cmd = "Mason",
        keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
        build = ":MasonUpdate",
        opts = {
          ui = {
            width = 0.8,
            height = 0.8,
            border = "rounded",
            icons = {
              package_installed = "",
              package_pending = "",
              package_uninstalled = "",
            },
          },
        },
        config = true,
      },
    },
    config = function()
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = true,
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "jedi_language_server",
          -- "pylsp",
          "lua_ls@3.15.0",
          "ruff",
          "yamlls",
        },
      })
    end,
  },
  -- nvim-lint
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      local mypy = lint.linters.mypy
      mypy.args = vim.list_extend(mypy.args, {
        "--python-executable",
        function()
          return vim.fn.exepath("python3") or vim.fn.exepath("python")
        end
      })
      lint.linters_by_ft = {
        python = { 'mypy' },
        c = { 'cpplint' },
        cpp = { 'cpplint' },
      }
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          lint.try_lint()
        end,
      })
    end,
  },
}

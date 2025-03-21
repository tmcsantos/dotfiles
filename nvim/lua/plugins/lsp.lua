return {
  -- lsp-zero and mason
  -- TODO: ditch lsp-zero
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    lazy = true,
    opts = {},
    config = false,
    init = function()
      -- Disable automatic setup, we are doing it manually
      vim.g.lsp_zero_extend_cmp = 0
      vim.g.lsp_zero_extend_lspconfig = 0
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    keys = {
      { "<leader>ll", "<cmd>LspLog<cr>",     desc = "Lsp Log" },
      { "<leader>li", "<cmd>LspInfo<cr>",    desc = "Lsp Info" },
      { "<leader>lr", "<cmd>LspRestart<cr>", desc = "Lsp Restart" },
    },
    dependencies = {
      {
        "folke/neoconf.nvim",
        cmd = "Neoconf",
        config = false,
        dependencies = { "nvim-lspconfig" },
      },
      { "folke/neodev.nvim", opts = {} },
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_lspconfig()

      lsp_zero.on_attach(function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
        local opts = { buffer = bufnr, remap = false, silent = true, noremap = true }

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
      end)
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
      local lsp_zero = require("lsp-zero")
      local lspconfig = require("lspconfig")

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
          "lua_ls",
          "ruff",
          "yamlls",
        },
        handlers = {
          lsp_zero.default_setup,
          -- Lua
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            lspconfig.lua_ls.setup(lua_opts)
          end,
          -- YAML
          yamlls = function()
            lspconfig.yamlls.setup({
              settings = {
                yaml = {
                  format = { enable = true },
                  keyOrdering = false,
                  validate = true,
                  completion = true,
                  schemaStore = {
                    enable = true,
                    url = "https://www.schemastore.org/api/json/catalog.json",
                  },
                  schemas = {
                    kubernetes = {
                      "helm/**/templates/**/*.{yml,yaml}",
                      "kube/**/*.{yml,yaml}",
                      "**/*.k8s.{yml,yaml}",
                    },
                    -- seldon schema
                    [vim.uv.os_homedir() .. "/k8s-schema/seldondeployment.json"] = "**/*.sdep.{yml,yaml}",
                    -- istio schema
                    [vim.uv.os_homedir() .. "/k8s-schema/virtualservice.json"] = "**/*.{vs,virtualservice}.{yml,yaml}",
                    [vim.uv.os_homedir() .. "/k8s-schema/gateway.json"] = "**/*.{gateway}.{yml,yaml}",
                    -- github schema
                    ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
                    ["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
                    -- kustomization
                    ["https://json.schemastore.org/kustomization.json"] = "kustomization.{yml,yaml}",
                  },
                },
              },
            })
          end,
          -- python
          -- pylsp = function()
          --   lspconfig.pylsp.setup({
          --     settings = {
          --       pylsp = {
          --         plugins = {
          --           ruff = { enabled = false },
          --           rope_autoimport = { enabled = true }
          --         }
          --       }
          --     }
          --   })
          -- end,
          ruff = function()
            lspconfig.ruff.setup({
              on_init = function(client)
                client.server_capabilities.hoverProvider = false
              end,
            })
          end,
          -- rust
          rust_analyzer = function() end,
          -- rust_analyzer = function()
          --   lspconfig.rust_analyzer.setup({
          --     on_attach = function(_, bufnr)
          --       vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
          --     end,
          --     settings = {
          --       ["rust-analyzer"] = {
          --         inlayHints = {
          --           parameterHints = { enable = false },
          --           closingBraceHints = { enable = false },
          --         },
          --       },
          --     },
          --   })
          -- end,
          -- clang
          clangd = function()
            lspconfig.clangd.setup({
              filetypes = { "c", "cpp", "objc", "objcpp", "cuda" }, -- exclude "proto".
            })
          end,
        },
      })
    end,
  },
  -- none-ls
  -- {
  --   "nvimtools/none-ls.nvim",
  --   config = function()
  --     local null_ls = require("null-ls")
  --     local diagnostics = null_ls.builtins.diagnostics
  --     null_ls.setup({
  --       sources = {
  --         diagnostics.mypy
  --       }
  --     })
  --   end,
  -- },
  -- nvim-lint
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        python = { 'mypy' },
      }
      vim.api.nvim_create_autocmd({ "BufWritePost" }, {
        callback = function()
          -- try_lint without arguments runs the linters defined in `linters_by_ft`
          -- for the current filetype
          lint.try_lint()
        end,
      })
    end,
  },
}

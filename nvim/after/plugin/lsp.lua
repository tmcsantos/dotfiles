require('neodev').setup({
  library = {
    plugins = { 'nvim-dap-ui' },
    types = true,
  },
})

local lsp_zero = require('lsp-zero')
lsp_zero.preset('recommended')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
  local opts = { buffer = bufnr, remap = false, silent = true, noremap = true }

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)

  vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
  vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
  vim.keymap.set("n", "<leader>D", require('telescope.builtin').lsp_type_definitions, opts)
  vim.keymap.set("n", "<leader>ds", require('telescope.builtin').lsp_document_symbols, opts)
  vim.keymap.set("n", "<leader>ws", require('telescope.builtin').lsp_workspace_symbols, opts)

  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)

  vim.keymap.set("i", "<C-j>", '<C-R>=copilot#Accept("")<CR>', opts)
  vim.keymap.set("i", "<C-l>", '<C-R>=copilot#Next()<CR>', opts)
  vim.keymap.set("i", "<C-h>", '<C-R>=copilot#Previous()<CR>', opts)
end)

lsp_zero.format_mapping("<leader>f", {
  format_opt = {
    async = false,
    timeout_ms = 1500,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['diagnosticls'] = { 'python' },
  }
})


local lspconfig = require('lspconfig')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { "lua_ls", "ruff_lsp", "jedi_language_server", "yamlls", "diagnosticls", },
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
              url = 'https://www.schemastore.org/api/json/catalog.json',
            },
            schemas = {
              kubernetes = {
                "helm/**/templates/**/*.{yml,yaml}",
                "kube/**/*.{yml,yaml}",
                "**/*.k8s.{yml,yaml}",
              },
              -- seldon schema
              ["/Users/tsantos/k8s-schema/seldondeployment.json"] = "**/*.sdep.{yml,yaml}",
              -- istio schema
              ["/Users/tsantos/k8s-schema/virtualservice.json"] = "**/*.{vs,virtualservice}.{yml,yaml}",
              ["/Users/tsantos/k8s-schema/gateway.json"] = "**/*.{gateway}.{yml,yaml}",
              -- github schema
              ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
              ["https://json.schemastore.org/github-action.json"] = ".github/action.{yml,yaml}",
              -- kustomization
              ['https://json.schemastore.org/kustomization.json'] = 'kustomization.{yml,yaml}',
            }
          }
        }
      })
    end,
    ruff_lsp = function()
      lspconfig.ruff_lsp.setup({
        on_init = function(client)
          client.server_capabilities.hoverProvider = false
        end
      })
    end,
    diagnosticls = function()
      lspconfig.diagnosticls.setup({
        filetypes = { "python", },
        init_options = {
          filetypes = {
            python = "flake8",
          },
          formatFiletypes = {
            python = { "yapf", "isort" },
          },
          formatters = {
            yapf = {
              command = "yapf",
              args = { "--quiet" },
              rootPatterns = {
                'requirements.txt',
                '.style.yapf',
                'setup.cfg',
                'pyproject.toml',
                '.git',
              },
            },
            isort = {
              command = "isort",
              args = { "--quiet", "--stdout", "-" },
              rootPatterns = { "pyproject.toml", ".isort.cfg", ".git" },
            }
          },
        }
      })
    end,
  },
})
require('mason-nvim-dap').setup({
  automatic_setup = true,
  ensure_installed = { 'python', },
  handlers = {
    function(config)
      -- all sources with no handler get passed here
      -- Keep original functionality
      require('mason-nvim-dap').default_setup(config)
    end,
    -- python = function(config)
    --     config.adapters = {
    --      type = "executable",
    --      command = "/usr/bin/python3",
    --      args = {
    --       "-m",
    --       "debugpy.adapter",
    --      },
    --     }
    --     require('mason-nvim-dap').default_setup(config) -- don't forget this!
    -- end,
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_action = lsp_zero.cmp_action()
cmp.setup({
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-y>'] = cmp.mapping.confirm({
      select = true, -- behavior = cmp.ConfirmBehavior.Replace,
    }),
    ['<CR>'] = vim.NIL,
  }),
  sources = {
    -- { name = 'buffer' },
    { name = 'path' },
    -- { name = 'luasnip' },
    {
      name = 'nvim_lsp',
      entry_filter = function(entry, _)
        return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
      end
    },
  },
})

require('dapui').setup()

vim.diagnostic.config({
  virtual_text = true,
})

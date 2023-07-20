require('neodev').setup({
    library = { plugins = { 'nvim-dap-ui' }, types = true },
})
local lsp = require('lsp-zero')

lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

lsp.ensure_installed({
    'lua_ls',
})

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            completion = {
                keywordSnippet = 'Disabled',
                showWord = 'Disabled',
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = { enable = false },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim', 'describe', 'it', 'before_each', 'after_each' },
            }
        }
    }
})

lsp.configure('yamlls', {
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

-- lsp.configure('pyright', {
--     settings = {
--         pyright = {
--             disableLanguageServices = true,
--             disableOrganizeImports = true,
--         },
--         python = {
--             venvPath = '.venv',
--             analysis = {
--                 autoSearchPaths = true,
--                 autoImportCompletions = true,
--                 diagnosticMode = "workspace",
--             },
--         },
--     }
-- })

-- lsp.configure('pylsp', {
--     settings = {
--         pylsp = {
--             configurationSources = { 'flake8' },
--             plugins = {
--                 ruff = { enabled = true },
--                 rope_autoimport = { enabled = true },
--                 autopep8 = { enabled = false },
--                 flake8 = { enabled = false },
--                 jedi_completion = {
--                     enabled = true,
--                     fuzzy = true,
--                 },
--                 pylint = { enabled = false },
--                 pyflakes = { enabled = false },
--                 mccabe = { enabled = false },
--                 pycodestyle = { enabled = false },
--                 yapf = { enabled = true },
--             },
--         }
--     }
-- })

lsp.configure('ruff_lsp', {
    on_init = function(client)
        client.server_capabilities.hoverProvider = false
    end
})

lsp.configure('diagnosticls', {
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


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({
        -- behavior = cmp.ConfirmBehavior.Replace,
        select = true,
    }),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = vim.NIL,
    -- ['<TAB>'] = vim.NIL,
    -- ['<S-TAB>'] = vim.NIL,
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
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

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = false, silent = true, noremap = true }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, opts)

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
    vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "<leader>ds", require('telescope.builtin').lsp_document_symbols, opts)
    vim.keymap.set("n", "<leader>ws", require('telescope.builtin').lsp_dynamic_workspace_symbols, opts)

    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>rr", vim.lsp.buf.rename, opts)

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
        vim.lsp.buf.format { async = true, timeout_ms = 5000 }
    end, opts)


    vim.keymap.set("i", "<C-j>", '<C-R>=copilot#Accept("")<CR>', opts)
    vim.keymap.set("i", "<C-l>", '<C-R>=copilot#Next()<CR>', opts)
    vim.keymap.set("i", "<C-h>", '<C-R>=copilot#Previous()<CR>', opts)
end)

require('mason').setup()
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
require('dapui').setup()

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

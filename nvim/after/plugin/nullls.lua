local lsp = require('lsp-zero')

-- configure null-ls
local null_ls = require("null-ls")
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)

        local format_cmd = function(input)
            vim.lsp.buf.format({
                id = client.id,
                timeout_ms = 5000,
                async = input.bang,
            })
        end

        local bufcmd = vim.api.nvim_buf_create_user_command
        bufcmd(bufnr, 'NullFormat', format_cmd, {
            bang = true,
            range = true,
            desc = 'Format using null-ls'
        })
    end,
    sources = {
        -- Add tools not supported by mason.nvim
    }
})

require('mason-null-ls').setup({
    ensure_installed = nil,
    automatic_installation = true,
    automatic_setup = false,
})
require('mason-null-ls').setup_handlers()

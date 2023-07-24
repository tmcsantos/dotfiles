-- See `:help telescope.builtin`
local builtin = require('telescope.builtin')
local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        layout_strategy = 'vertical',
        file_ignore_patterns = {
            "node_modules/.*",
            "secret.d/*",
            "%.pem",
        },
        mappings = {
            i = {
                ["<ESC>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    }
})

require('telescope').load_extension('fzf')
require('telescope').load_extension('ui-select')

vim.keymap.set('n', '<C-p>', function()
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
        builtin.git_files({})
    else
        builtin.find_files({ hidden = true })
    end
end, {})

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

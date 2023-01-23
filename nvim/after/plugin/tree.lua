-- empty setup using defaults
require("nvim-tree").setup({
    actions = {
        open_file = { quit_on_open = false }
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    git = {
        enable = true,
    },
    filters = {
        custom = { '^.git$', '^node_modules$' }
    }
})

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)

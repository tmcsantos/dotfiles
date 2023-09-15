-- empty setup using defaults
require("nvim-tree").setup({
    view = {
        width = 35,
    },
    actions = {
        open_file = { quit_on_open = false }
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    git = {
        enable = true,
    },
    filters = {
        custom = { '^.git$', '^node_modules$' }
    }
})

vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeToggle)

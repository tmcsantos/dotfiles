-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>+", ":vertical resize +5<CR>", { silent = true })
vim.keymap.set("n", "<leader>-", ":vertical resize -5<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<S-l>", "20zl")
vim.keymap.set("n", "<S-h>", "20zh")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Clears hlsearch after doing search
vim.keymap.set('n', '<ESC>', '<cmd>nohlsearch<CR>')

-- terminal
-- Do I want this?
-- local opts = { noremap = true }
-- vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')
--
-- vim.api.nvim_command('augroup neovim_terminal')
-- vim.api.nvim_command('autocmd!')
-- vim.api.nvim_command('autocmd TermOpen * startinsert')
-- vim.api.nvim_command('autocmd TermOpen * :set nonumber norelativenumber')
-- vim.api.nvim_command('augroup END')
--
-- vim.keymap.set("n", "<leader>k9", '<cmd>vsplit term://k9s<cr>', opts)
-- vim.keymap.set("n", "<leader>tt", '<cmd>vsplit term://bash<cr>', opts)
-- vim.keymap.set("n", "<leader>py", '<cmd>vsplit term://ipython<cr>', opts)

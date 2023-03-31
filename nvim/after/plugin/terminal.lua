local opts = { noremap = true }

-- vim.keymap.set("n", "<leader>k9", '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9 k9s<CR>', opts)
-- vim.keymap.set("n", "<leader>tt", '<CMD>FloatermNew --autoclose=2 --height=0.9 --width=0.9<CR>', opts)
vim.keymap.set("n", "<leader>k9", '<cmd>vsplit term://k9s<cr>', opts)
vim.keymap.set("n", "<leader>tt", '<cmd>vsplit term://bash<cr>', opts)
vim.keymap.set("n", "<leader>py", '<cmd>vsplit term://ipython<cr>', opts)

local opts = { noremap = true }

vim.keymap.set("n", "<leader>k9", '<cmd>vsplit term://k9s<cr>', opts)
vim.keymap.set("n", "<leader>tt", '<cmd>vsplit term://bash<cr>', opts)
vim.keymap.set("n", "<leader>py", '<cmd>vsplit term://ipython<cr>', opts)

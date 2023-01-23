require("tmcsantos.packer")
require("tmcsantos.set")
require("tmcsantos.remap")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')

vim.api.nvim_command('augroup neovim_terminal')
vim.api.nvim_command('autocmd!')
vim.api.nvim_command('autocmd TermOpen * startinsert')
vim.api.nvim_command('autocmd TermOpen * :set nonumber norelativenumber')
vim.api.nvim_command('augroup END')


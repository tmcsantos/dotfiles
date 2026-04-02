-- shamefully copied from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
local function augroup(name)
  return vim.api.nvim_create_augroup("tmcsantos_" .. name, { clear = true })
end

-- [[ Highlight on yank ]]
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    -- vim.highlight.on_yank() -- deprecated, this guys...
    vim.hl.on_yank()
  end,
  group = augroup("highlight_yank"),
  pattern = '*',
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup("resize_splits"),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- [[ Change syntax for Helm ]]
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  group = augroup("helm"),
  pattern = '*/templates/*.{yml,yaml,tpl}',
  callback = function()
    vim.bo.filetype = 'helm'
    vim.bo.syntax = 'yaml'
  end
})

-- Cursor highlight control
-- Only have it on in the active buffer
local cursorline = augroup("CursorLineControl")
vim.api.nvim_create_autocmd({ 'VimEnter', 'WinEnter', 'BufWinEnter' }, {
  group = cursorline,
  callback = function()
    vim.opt_local.cursorline = true
  end
})
vim.api.nvim_create_autocmd({ 'WinLeave' }, {
  group = cursorline,
  callback = function()
    vim.opt_local.cursorline = false
  end
})

-- au BufReadCmd *.whl call zip#Browse(expand("<amatch>"))
-- Create an autocommand for reading .whl files
vim.api.nvim_create_autocmd("BufReadCmd", {
  group = augroup("python"),
  pattern = "*.whl",
  command = "call zip#Browse(expand('<amatch>'))",
})

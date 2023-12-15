-- shamefully copied from https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
local function augroup(name)
  return vim.api.nvim_create_augroup("tmcsantos_" .. name, { clear = true })
end

-- [[ Highlight on yank ]]
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
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
local set_cursorline = function(event, value, pattern)
  vim.api.nvim_create_autocmd(event, {
    group = augroup("CursorLineControl"),
    pattern = pattern,
    callback = function()
      vim.opt_local.cursorline = value
    end,
  })
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePrompt")

return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
    vim.keymap.set("n", "<leader>gb", ":Git blame<cr>")
  end
}

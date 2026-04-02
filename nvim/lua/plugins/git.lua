return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
      vim.keymap.set("n", "<leader>gb", ":Git blame<cr>")
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
          ignore_whitespace = true,
        },
      })
    end
  }
}

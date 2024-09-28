local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>cc",
  function()
    vim.cmd.RustLsp { 'flyCheck', "run" }
  end,
  { silent = true, buffer = bufnr }
)

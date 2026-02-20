-- local function ra_flycheck()
--   local clients = vim.lsp.get_clients({
--     name = 'rust_analyzer',
--   })
--   for _, client in ipairs(clients) do
--     local params = vim.lsp.util.make_text_document_params()
--     client.notify('rust-analyzer/runFlycheck', params)
--   end
-- end
local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>cc",
  function()
    vim.cmd.RustLsp { 'flyCheck', "run" }
  end,
  -- ra_flycheck,
  { silent = true, buffer = bufnr }
)

require("noice").setup({
  cmdline = {
    enabled = true,
  },
  lsp = {
    progress = {
      enabled = true,
      format = 'lsp_progress',
      format_done = 'lsp_progress_done',
    },
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = false,        -- use a classic bottom cmdline for search
    command_palette = true,       -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true,        -- add a border to hover docs and signature help
  },
  views = {
    cmdline_popup = {
      position = {
        row = 10,
      },
    },
    cmdline_popupmenu = {
      position = {
        row = 13,
      },
    },
  },
})

require('notify').setup({
  background_colour = '#000000',
  render = 'minimal',
  stages = 'slide',
  timeout = 1500,
  top_down = true,
  level = 'ERROR',
})

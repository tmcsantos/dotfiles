return {
  -- consider replacing with zbirenbaum/copilot.lua
  "github/copilot.vim",
  enabled = false,
  config = function()
    local opts = { remap = false, silent = true, noremap = true }

    vim.g.copilot_assume_mapped = true
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_filetypes = {
      ["*"] = false,
      ["javascript"] = true,
      ["typescript"] = true,
      ["lua"] = false,
      ["rust"] = true,
      ["c"] = true,
      ["c#"] = true,
      ["c++"] = true,
      ["go"] = true,
      ["python"] = true,
    }

    vim.g.copilot_enabled = false
    vim.keymap.set("i", "<C-j>", '<C-R>=copilot#Accept("")<CR>', opts)
    vim.keymap.set("i", "<C-l>", '<C-R>=copilot#Next()<CR>', opts)
    vim.keymap.set("i", "<C-h>", '<C-R>=copilot#Previous()<CR>', opts)

    function CopilotEnable()
      vim.g.copilot_enabled = true
    end
  end
}

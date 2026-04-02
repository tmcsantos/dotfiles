return {
  {
    "olimorris/codecompanion.nvim",
    enabled = false,
    opts = {},
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      local companion = require("codecompanion")
      local adapters = require("codecompanion.adapters")
      companion.setup({
        strategies = {
          chat = { adapter = "ollama_chat" },
          inline = { adapter = "ollama_code" },
        },
        adapters = {
          http = {
            ollama_chat = function()
              return adapters.extend("ollama", {
                schema = {
                  model = { default = "cogito:3b" }
                }
              })
            end,
            ollama_code = function()
              return adapters.extend("ollama", {
                schema = {
                  model = { default = "qwen2.5-coder:1.5b" }
                }
              })
            end
          }
        }
      })
    end
  },
}

-- return {
--   -- consider replacing with zbirenbaum/copilot.lua
--   "github/copilot.vim",
--   enabled = false,
--   config = function()
--     local opts = { remap = false, silent = true, noremap = true }
--
--     vim.g.copilot_assume_mapped = true
--     vim.g.copilot_no_tab_map = true
--     vim.g.copilot_filetypes = {
--       ["*"] = false,
--       ["javascript"] = true,
--       ["typescript"] = true,
--       ["lua"] = false,
--       ["rust"] = true,
--       ["c"] = true,
--       ["c#"] = true,
--       ["c++"] = true,
--       ["go"] = true,
--       ["python"] = true,
--     }
--
--     vim.g.copilot_enabled = false
--     vim.keymap.set("i", "<C-j>", '<C-R>=copilot#Accept("")<CR>', opts)
--     vim.keymap.set("i", "<C-l>", '<C-R>=copilot#Next()<CR>', opts)
--     vim.keymap.set("i", "<C-h>", '<C-R>=copilot#Previous()<CR>', opts)
--
--     function CopilotEnable()
--       vim.g.copilot_enabled = true
--     end
--   end
-- }

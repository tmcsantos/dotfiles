return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "VonHeikemen/lsp-zero.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      -- Config autocompletion settings
      local lsp_zero = require("lsp-zero")
      lsp_zero.extend_cmp()

      local cmp = require("cmp")
      local cmp_select = { behavior = cmp.SelectBehavior.Select }
      local cmp_action = lsp_zero.cmp_action()
      cmp.setup({
        formatting = lsp_zero.cmp_format(),
        snippet = {
          expland = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<C-f>"] = cmp_action.luasnip_jump_forward(),
          ["<C-b>"] = cmp_action.luasnip_jump_backward(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-y>"] = cmp.mapping.confirm({
            select = true, -- behavior = cmp.ConfirmBehavior.Replace,
          }),
          ["<CR>"] = vim.NIL,
        }),
        sources = {
          { name = "path" },
          {
            name = "nvim_lsp",
            entry_filter = function(entry, _)
              return cmp.lsp.CompletionItemKind.Text ~= entry:get_kind()
            end
          },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "spell" },
          { name = "treesitter" },
        },
      })
    end
  },
}

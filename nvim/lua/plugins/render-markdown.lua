return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  opts = {},
  config = function()
    require("render-markdown").setup({
      indent = {
        enabled = true,
      },
      code = {
        border = "thin",
      },
    })
  end,
}

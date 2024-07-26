return {
  "mistricky/codesnap.nvim",
  build = "make",
  config = function()
    require("codesnap").setup({
      has_breadcrumbs = true,
      code_font_family = "Monaco Nerd Font Mono",
      watermark = "",
    })
  end,
}

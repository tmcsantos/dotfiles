return {
  "mistricky/codesnap.nvim",
  tag = "v2.0.0",
  config = function()
    require("codesnap").setup({
      snapshot_config = {
        code_config = {
          breadcrumbs = {
            enable = true,
            font_family = "Monaco Nerd Font Mono",
          },
        },
      },
    })
  end,
}

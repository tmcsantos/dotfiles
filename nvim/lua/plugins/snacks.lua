return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    indent = {
      animate = {
        style = "out",
        easing = "inOutQuart",
      }
    },
    quickfile = { enabled = true },
    scope = { enabled = true },
    words = { enabled = true },
  },
}

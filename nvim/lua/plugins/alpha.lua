return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("<leader>sf", " " .. " Search Files", ":Telescope find_files<CR>"),
      dashboard.button("<leader>sw", " " .. " Search Word", ":Telescope live_grep<CR>"),
      dashboard.button("<leader>?", "󰄉 " .. " Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("l", "󰒲 " .. " Lazy", ":Lazy<CR>"),
      dashboard.button("<leader>cm", "󱌣 " .. " Mason", ":Mason<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }

    alpha.setup(dashboard.opts)
  end
};

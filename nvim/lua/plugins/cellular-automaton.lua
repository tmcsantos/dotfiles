return {
  "eandrju/cellular-automaton.nvim",
  config = function()
    -- vim.keymap.set("n", "<leader>ml", "<cmd>CellularAutomaton make_it_rain<CR>")
    vim.keymap.set("n", "<leader>ml", function()
      local automaton = require("cellular-automaton")
      local animation_list = vim.tbl_keys(automaton.animations)
      automaton.start_animation(animation_list[math.random(#animation_list)])
    end)
  end,
}

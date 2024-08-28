return {
  "nomnivore/ollama.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },

  -- All the user commands added by the plugin
  cmd = { "Ollama", "OllamaModel", "OllamaServe", "OllamaServeStop" },

  keys = {
    -- Sample keybind for prompt menu. Note that the <c-u> is important for selections to work properly.
    {
      "<leader>oo",
      ":<c-u>lua require('ollama').prompt()<cr>",
      desc = "ollama prompt",
      mode = { "n", "v" },
    },
  },

  config = function()
    local ollama = require("ollama")
    local action = require("ollama.actions.factory").create_action({
      display = true,
      window = "vsplit",
    })
    ollama.setup({
      model = "phi3:mini",
      prompts = {
        Ask_About_Context = {
          prompt = "$input\n\n```$ftype\n$buf```",
          action = action,
          input_label = ">",
        },
      },
    })
  end,
}

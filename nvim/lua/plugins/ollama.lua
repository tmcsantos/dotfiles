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
      -- model = "deepseek-r1:7b",
      -- model = "gemma3:12b",
      model = "gemma3:4b",
      prompts = {
        Ask_About_Context = {
          prompt = "$input\n\n```$ftype\n$buf```",
          action = action,
          input_label = ">>>",
        },
        More = {
          prompt = "$sel\n\n$input\n",
          action = action,
          input_label = ">>>",
        },
        Generate_Docstring = {
          prompt = "You are a helpful code understanding assistant.\n"
              .. "Please look at the following code and create a comprehensive docstring.\n"
              .. "Each line of the docstring should be no longer than 100 characters.\n"
              .. "\n```$ftype\n$sel\n```",
          -- prompt = "Generate a docstring for this code:\n```$ftype\n$sel\n```"
          action = action,
          input_label = ">>>"
        },
      },
    })
  end,
}

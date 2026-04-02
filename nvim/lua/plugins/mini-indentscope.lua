return {
	"echasnovski/mini.indentscope",
	version = false,
	event = "BufEnter",
	config = function()
		local mini = require("mini.indentscope")
		mini.setup({
			symbol = "│",
			options = { try_as_border = true },
			draw = {
				animation = mini.gen_animation.quartic({
					easing = "out",
					duration = 10,
					unit = "step",
				}),
			},
		})
	end,
}

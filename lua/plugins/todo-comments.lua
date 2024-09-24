return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local todo_commnets = require("todo-comments")
		todo_commnets.setup({})

		vim.keymap.set("n", "]l", function()
			require("todo-comments").jump_next()
		end, { desc = "Next todo comment" })

		vim.keymap.set("n", "[l", function()
			require("todo-comments").jump_prev()
		end, { desc = "Previous todo comment" })
	end,
}

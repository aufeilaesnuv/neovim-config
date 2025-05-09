-- Highlight todo, notes, etc in comments
return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
		highlight = {
			before = "",
			keyword = "bg",
			after = "",
			pattern = [[.*<(KEYWORDS)\s*]],
		},
	},
}

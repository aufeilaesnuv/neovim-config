return {
	"mrcjkb/rustaceanvim",
	version = "^6", -- Recommended
	lazy = false, -- This plugin is already lazy

	config = function()
		vim.keymap.set("n", "<leader>cr", ":term<CR>icargo run<CR>")
	end,
}

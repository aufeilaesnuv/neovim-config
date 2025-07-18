return {
	"echanovski/mini.nvim",
	version = false,
	config = function()
		require("mini.icons").setup()
		require("mini.files").setup({
			mappings = {
				synchronize = "<CR>",
			},
		})

		MiniFiles = require("mini.files")
		vim.keymap.set("n", "<leader>e", function()
			if not MiniFiles.close() then
				MiniFiles.open()
			end
		end, { desc = "Open MiniFiles" })
	end,
}

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
		require("mini.ai").setup()
		require("mini.surround").setup()

		MiniFiles = require("mini.files")
		vim.keymap.set("n", "<leader>e", function()
			if not MiniFiles.close() then
				MiniFiles.open(vim.api.nvim_buf_get_name(0))
			end
		end, { desc = "Toggle MiniFiles" })
	end,
}

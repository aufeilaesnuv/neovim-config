return {
	"echasnovski/mini.nvim",
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

		local notify = require("mini.notify")
		notify.setup()
		vim.notify = notify.make_notify({
			ERROR = { duration = 5000 },
			WARN = { duration = 4000 },
			INFO = { duration = 3000 },
		})

		local files = require("mini.files")
		vim.keymap.set("n", "<leader>e", function()
			if not files.close() then
				files.open(vim.api.nvim_buf_get_name(0))
			end
		end, { desc = "Toggle MiniFiles" })
	end,
}

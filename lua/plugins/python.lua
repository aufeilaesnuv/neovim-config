return {
	"Vimjas/vim-python-pep8-indent",
	ft = "python",

	config = function()
		vim.keymap.set("n", "<leader>p3", function()
			local file_path = vim.fn.expand("%")
			vim.cmd("term python3 " .. vim.fn.shellescape(file_path))
		end)
	end,
}

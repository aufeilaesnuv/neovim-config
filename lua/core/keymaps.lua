vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar's default behaviour in normal and visual mode
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

local opts = { noremap = true, silent = true }

-- save file
-- vim.keymap.set("n", "<C-s>", "<cmd>noautocmd w <CR>", opts)
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>", opts)
vim.keymap.set({ "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>", opts)

-- save & auto-format
-- vim.keymap.set("n", "<leader>sn", "<cmd> w <CR>", opts)

-- undo
vim.keymap.set("n", "<C-z>", "u", opts)
vim.keymap.set("i", "<C-z>", "<Esc>u", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- keep cursor centered when searching
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bp | bd #<CR>", { desc = "Close buffer but keep split" })
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer
vim.keymap.set("n", "<leader>tm", ":term<CR>i", opts) -- open terminal
vim.keymap.set("n", "<leader>X", ":%bd|e#<CR>", { desc = "Close all buffers except current" })

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)
vim.keymap.set("n", "<leader>o", "<C-w>o", { desc = "Close all other splits" })

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", opts) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", opts) -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", opts) --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", opts) --  go to previous tab

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- copy relative file path in clipboard
vim.keymap.set("n", "<leader>fp", function()
	local path = vim.fn.expand("%")
	vim.fn.setreg("+", path)
	vim.notify("Copied path: " .. path)
end, opts)

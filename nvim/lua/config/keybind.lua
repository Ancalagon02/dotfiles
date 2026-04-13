local function map(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
	})
end


map("n", "<leader>t", ":split | terminal<CR>", "open terminal")
map('t', '<Esc>', '<C-\\><C-n>', "close terminal")

map("v", "J", ":m '>+1<CR>gv=gv", "moves lines down in visual selection")
map("v", "K", ":m '<-2<CR>gv=gv", "moves lines up in visual selection")

map("n", "<esc>", "<cmd>nohlsearch<CR>")
map("n", "<C-c>", "<cmd>nohlsearch<CR>")


-- Local helper function for consistent keymapping
local function map(mode, lhs, rhs, desc, expr, bufnr)
	vim.keymap.set(mode, lhs, rhs, {
		noremap = true,
		silent = true,
		desc = desc,
		expr = expr or false,
		buffer = bufnr, -- Sets the mapping for the specific LSP buffer only
	})
end

--- General Keymaps (Global) ---
map("n", "<leader>to", ":split | terminal<CR>", "open terminal")
map('t', '<esc>', '<C-\\><C-n>', "close terminal")

map("v", "J", ":m '>+1<CR>gv=gv", "moves lines down in visual selection")
map("v", "K", ":m '<-2<CR>gv=gv", "moves lines up in visual selection")

map("n", "<esc>", "<cmd>nohlsearch<CR>", "Clear search highlights")
map("n", "<C-c>", "<cmd>nohlsearch<CR>", "Clear search highlights")

--- Telescope General Keymaps ---
local telescope = require('telescope.builtin')
map("n", "<leader>ff", telescope.find_files, "Telescope find files")
map("n", "<leader>fg", telescope.live_grep, "Telescope live grep")
map("n", "<leader>fb", telescope.buffers, "Telescope buffers")
map("n", "<leader>fh", telescope.help_tags, "Telescope help tags")

--- LSP Configuration (Inside LspAttach) ---
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(e)
		local bufnr = e.buf
		local ts_builtin = require('telescope.builtin')
		vim.diagnostic.config({ virtual_text = { current_line = true } })

		-- LSP Toggle: Virtual Text
		map("n", "<leader>tt", function()
			local current = vim.diagnostic.config().virtual_text
			if current then
				vim.diagnostic.config({ virtual_text = false })
			else
				vim.diagnostic.config({ virtual_text = { current_line = true } })
			end
		end, "Toggle Virtual Text [LSP]", false, bufnr)

		-- Navigation via Telescope
		map("n", "<leader>vg", ts_builtin.lsp_definitions, "go to definitions [lsp]", false, bufnr)
		map("n", "<leader>vi", ts_builtin.lsp_implementations, "go to implementations [lsp]", false, bufnr)
		map("n", "<leader>vr", ts_builtin.lsp_references, "show references [lsp]", false, bufnr)
		map("n", "<leader>vt", ts_builtin.lsp_type_definitions, "show type definitions [lsp]", false, bufnr)
		map("n", "<leader>vb", function() ts_builtin.diagnostics({ bufnr = 0 }) end, "open diagnostics for file [lsp]", false,
			bufnr)

		-- Standard LSP Buffer Actions
		map("n", "<leader>vd", vim.diagnostic.open_float, "Open Diagnostics [LSP]", false, bufnr)
		map("n", "K", vim.lsp.buf.hover, "Hover [LSP]", false, bufnr)
		map({ "n", "v" }, "<leader>va", vim.lsp.buf.code_action, "Code Action [LSP]", false, bufnr)
		map("n", "<leader>vn", vim.lsp.buf.rename, "Code Rename [LSP]", false, bufnr)
		map("n", "<leader>vf", function() vim.lsp.buf.format({ async = true }) end, "Code Format [LSP]", false, bufnr)

		-- Documentation / Signature
		map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature Help [LSP]", false, bufnr)

		-- Inlay Hints
		map("n", "<leader>vh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "Toggle Inlay Hints [LSP]", false, bufnr)

		-- Completion Menu (Scoped to LSP buffers)
		map("i", "<C-j>", function()
			return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
		end, "Next completion item", true, bufnr)

		map("i", "<C-k>", function()
			return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
		end, "Previous completion item", true, bufnr)

		map("i", "<CR>", function()
			return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
		end, "Accept completion", true, bufnr)
	end
})


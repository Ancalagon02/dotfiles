-- Local helper function for consistent keymapping
local function map(mode, lhs, rhs, desc, expr, bufnr, remap)
	vim.keymap.set(mode, lhs, rhs, {
		noremap = true,
		remap = remap,
		silent = true,
		desc = desc,
		expr = expr or false,
		buffer = bufnr, -- Sets the mapping for the specific LSP buffer only
	})
end

local smart_format = require("config.global").smart_format

--- General Keymaps (Global) ---
map("n", "<leader>to", ":split | terminal<CR>", "open terminal")
map("t", "<esc>", "<C-\\><C-n>", "close terminal")

map("v", "J", ":m '>+1<CR>gv=gv", "moves lines down in visual selection")
map("v", "K", ":m '<-2<CR>gv=gv", "moves lines up in visual selection")

map("n", "<esc>", "<cmd>nohlsearch<CR>", "Clear search highlights")
map("n", "<C-c>", "<cmd>nohlsearch<CR>", "Clear search highlights")

--- Telescope General Keymaps ---
local telescope = require("telescope.builtin")
map("n", "<leader>ff", telescope.find_files, "Telescope find files")
map("n", "<leader>fg", telescope.live_grep, "Telescope live grep")
map("n", "<leader>fb", telescope.buffers, "Telescope buffers")
map("n", "<leader>fh", telescope.help_tags, "Telescope help tags")

map("n", "<leader>cl", "gcc", "Toggle Comments", false, nil, true)
map({ "n", "v" }, "<leader>cc", "gc", "Toggle Comments lines", false, nil, true)

--- Window Management
map("n", "<leader>ws", "<cmd>vsplit<cr><esc>", "Open Window")
map("n", "<leader>wq", "<cmd>clo<cr><esc>", "Close Window")
map("n", "<leader>wh", "<C-W>h", "Move cursor to left")
map("n", "<leader>wj", "<C-W>j", "Move cursor to down")
map("n", "<leader>wk", "<C-W>k", "Move cursor to up")
map("n", "<leader>wl", "<C-W>l", "Move cursor to right")
map("n", "<leader>w<", "<C-W>10>", "Increase current window width")
map("n", "<leader>w>", "<C-W>10<", "Decrease current window width")
map("n", "<leader>we", "<C-W>=", "Make window splits equal size")

--- Visual Mode Line Moving
map("v", "J", ":m '>+1<CR>gv=gv", "Move lines down in visual selection")
map("v", "K", ":m '<-2<CR>gv=gv", "Move lines up in visual selection")

--- Scrolling and Search Centering
map("n", "J", "mzJ`z", "Join lines without moving cursor")
map("n", "<C-d>", "<C-d>zz", "Move down centered")
map("n", "<C-u>", "<C-u>zz", "Move up centered")
map("n", "n", "nzzzv", "Next search result centered")
map("n", "N", "Nzzzv", "Prev search result centered")

--- Better Indenting (Stay in Visual Mode)
map("v", "<", "<gv", "Indent left")
map("v", ">", ">gv", "Indent right")

--- Debugger Keymaps
local dap = require("dap")
local ui = require("dapui")

map("n", "<F5>", function()
	dap.continue()
end, "Debug: Continue")
map("n", "<F10>", function()
	dap.step_over()
end, "Debug: Step Over")
map("n", "<F11>", function()
	dap.step_into()
end, "Debug: Step Into")
map("n", "<F12>", function()
	dap.step_out()
end, "Debug: Step Out")

map("n", "<leader>dt", function()
	dap.toggle_breakpoint()
end, "Debug: Toggle Breakpoint")
map("n", "<leader>dr", function()
	dap.repl.open()
end, "Debug: Open REPL")
map("n", "<leader>du", function()
	ui.toggle()
end, "Debug: Toggle UI")
map("n", "<leader>dh", function()
	require("dap.ui.widgets").hover()
end, "Debug: Hover Variable")

map("n", "<leader>vf", smart_format, "Format Code")
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(e)
		local bufnr = e.buf
		local ts = require("telescope.builtin")

		--- 1. NAVIGATION (LSP) ---
		map("n", "K", vim.lsp.buf.hover, "Hover Information", false, bufnr)
		map("n", "<leader>vg", ts.lsp_definitions, "Go to Definition", false, bufnr)
		map("n", "<leader>vD", vim.lsp.buf.declaration, "Go to Declaration", false, bufnr)
		map("n", "<leader>vi", ts.lsp_implementations, "Go to Implementation", false, bufnr)
		map("n", "<leader>vr", ts.lsp_references, "Show References", false, bufnr)
		map("n", "<leader>vt", ts.lsp_type_definitions, "Show Type Definitions", false, bufnr)
		map("n", "<leader>vs", ts.lsp_document_symbols, "Document Symbols (List)", false, bufnr)
		map("n", "<leader>vS", ts.lsp_dynamic_workspace_symbols, "Workspace Symbols (Search)", false, bufnr)

		--- 2. MODIFICATION (LSP) ---
		map("n", "<leader>vn", vim.lsp.buf.rename, "Rename Symbol", false, bufnr)
		map({ "n", "v" }, "<leader>va", vim.lsp.buf.code_action, "Code Action", false, bufnr)

		--- 3. DIAGNOSTICS (Core) ---
		map("n", "<leader>dd", vim.diagnostic.open_float, "Line Diagnostics (Float)", false, bufnr)
		map("n", "<leader>db", function()
			ts.diagnostics({ bufnr = 0 })
		end, "File Diagnostics (List)", false, bufnr)
		-- Quick Jump Diagnostics
		map("n", "<leader>dn", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, "Next Diagnostic", false, bufnr)
		map("n", "<leader>dp", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, "Previous Diagnostic", false, bufnr)

		-- Diagnostic UI Toggle
		map("n", "<leader>tt", function()
			local current = vim.diagnostic.config().virtual_text
			vim.diagnostic.config({ virtual_text = not current and { current_line = true } or false })
		end, "Toggle Virtual Text", false, bufnr)

		--- 4. UI & HINTS (LSP) ---
		map("n", "<leader>vh", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, "Toggle Inlay Hints", false, bufnr)

		map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature Help", false, bufnr)

		--- 5. COMPLETION (Scoped to buffer) ---
		-- Note: Uses 'expr = true' for the ternary logic
		map("i", "<C-j>", function()
			return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
		end, "Next completion item", true, bufnr)

		map("i", "<C-k>", function()
			return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
		end, "Previous completion item", true, bufnr)

		map("i", "<CR>", function()
			return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
		end, "Confirm completion", true, bufnr)

		map("i", "<Tab>", function()
			return vim.fn.pumvisible() == 1 and "<C-y>" or "<Tab>"
		end, "Confirm completion", true, bufnr)
	end,
})

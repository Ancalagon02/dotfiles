local M = {}

local shell_formatters = {
	sh = "shfmt -i 2 -sr -bn",
	bash = "shfmt -i 2 -sr -bn",
	zsh = "shfmt -i 2 -sr -bn",
}

-- 2. Helper to run shell commands safely
local function run_shell_format(cmd)
	local view = vim.fn.winsaveview()

	-- Execute the shell pipe
	vim.cmd("silent! %!" .. cmd)

	-- Error Handling: if shell_error is non-zero, undo the change
	if vim.v.shell_error ~= 0 then
		vim.cmd("undo")
		print("Formatter error using: " .. cmd:split(" ")[1])
	end

	vim.fn.winrestview(view)
end

function M.smart_format()
	local ft = vim.bo.filetype
	local cmd = shell_formatters[ft]

	-- Priority 1: Use Shell Formatter if defined
	if cmd then
		run_shell_format(cmd)
		return
	end

	-- Priority 2: Fallback to LSP Formatting
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	for _, client in ipairs(clients) do
		if client.server_capabilities.documentFormattingProvider then
			vim.lsp.buf.format({ async = true })
			return
		end
	end

	-- Fallback 3: Notify user
	print("No formatter configured for " .. ft)
end

return M

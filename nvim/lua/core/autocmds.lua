local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("MyCoreGroup", { clear = true })

autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.highlight.on_yank()
	end,
})
autocmd("LspAttach", {
	group = augroup,
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		-- 1. Completion Logic
		if client and client:supports_method("textDocument/completion") then
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

autocmd("FileType", {
	group = augroup,
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

autocmd("BufEnter", {
	group = augroup,
	command = "set formatoptions-=cro",
})

vim.pack.add {
	"https://github.com/catppuccin/nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim"
}

vim.g.mapleader = " "
require("config.global")
require("config.keybind")
require("config.options")
require("plugins")

vim.filetype.add({
	pattern = {
		[".*/hypr/.*%.conf"] = "hyprlang",
		[".*/hyprland%.conf"] = "hyprlang",
	},
})

vim.lsp.enable({
	"lua_ls",
	"hyprls"
})

vim.lsp.enable({ "hyprls" })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			local chars = {}
			for i = 32, 126 do
				table.insert(chars, string.char(i))
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})


vim.api.nvim_create_autocmd("FileType", {
	callback = function() pcall(vim.treesitter.start) end,
})
vim.cmd.colorscheme("catppuccin")

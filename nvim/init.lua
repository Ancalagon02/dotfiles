require("config.options")
require("config.globals")
require("config.keymaps")

vim.lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

vim.lsp.enable({
	"lua_ls",
	"bash",
	"css",
	"json",
	"docker",
	"compose",
	"markdown",
	"go",
})

vim.filetype.add({
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
	},
})

-- Toggle virtual text
vim.diagnostic.config({ virtual_text = { current_line = true } })
vim.keymap.set("n", "<leader>tt", function()
	local config = vim.diagnostic.config()
	if config ~= nil then
		if config.virtual_text == false then
			vim.diagnostic.config({ virtual_text = { current_line = true } })
		else
			vim.diagnostic.config({ virtual_text = false })
		end
	end
end)

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = "plugins",
	change_detection = { notify = false },
})

vim.cmd.colorscheme("catppuccin")

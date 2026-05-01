vim.lsp.config("bashls", {
	filetypes = { "sh", "bash", "zsh" },
})


vim.lsp.enable({
	"lua_ls",
	"hyprls",
  "biome",
	"ruff",
	"pyright",
	"bashls",
	"cssls",
	"html",
	"jsonls",
	"stylua",
	"markdown_oxide",
  "taplo",
  "gopls",
  "clangd",
})


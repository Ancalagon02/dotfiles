vim.lsp.config('bashls', {
  filetypes = { 'sh', 'bash', 'zsh' }
})

vim.lsp.enable({
	"lua_ls",
	"hyprls",
	"ruff",
	"pyright",
  "bashls",
  "cssls",
  "html",
  "jsonls",
})


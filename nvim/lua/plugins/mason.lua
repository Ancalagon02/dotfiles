return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = { "williamboman/mason.nvim" },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "bashls", "jsonls", "cssls", "docker_compose_language_service", "dockerls", "marksman", "gopls" },
    })
  end
}

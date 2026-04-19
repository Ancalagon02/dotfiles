local M = {}

function M.smart_format()
  -- Expanded list based on Prettier's native support
  local prettier_fts = {
    "javascript", "javascriptreact", "typescript", "typescriptreact",
    "json", "jsonc", "json5",
    "html", "css", "scss", "less",
    "markdown", "markdown.mdx",
    "yaml", "graphql", "vue", "handlebars"
  }

  local is_prettier_ft = vim.tbl_contains(prettier_fts, vim.bo.filetype)

  local lsp_can_format = false
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  for _, client in ipairs(clients) do
    if client.server_capabilities.documentFormattingProvider then
      lsp_can_format = true
      break
    end
  end

  if is_prettier_ft then
    local view = vim.fn.winsaveview()
    -- We use --stdin-filepath to help Prettier detect the correct parser (especially for JSONC)
    vim.cmd("%!prettier --stdin-filepath " .. vim.fn.expand("%:p"))

    if vim.v.shell_error ~= 0 then
      vim.cmd("undo")
      print("Prettier error - check syntax")
    end
    vim.fn.winrestview(view)
  elseif lsp_can_format then
    vim.lsp.buf.format({ async = true })
  else
    print("No formatter available for " .. vim.bo.filetype)
  end
end

return M

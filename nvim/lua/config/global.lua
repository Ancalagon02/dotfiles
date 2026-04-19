local M = {}

function M.smart_format()
  local prettier_fts = {
    "javascript", "typescript", "json", "html", "css", "scss", "markdown", "yaml"
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
    vim.cmd("%!prettier --stdin-filepath " .. vim.fn.expand("%"))
    if vim.v.shell_error ~= 0 then
      vim.cmd("undo")
      print("Prettier error - check syntax")
    end
    vim.fn.winrestview(view)
  elseif lsp_can_format then
    vim.lsp.buf.format({ async = true })
  else
    print("No formatter available for this filetype")
  end
end

return M

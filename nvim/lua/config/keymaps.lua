local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd

map("n", "<C-c>", "<cmd>noh<cr><esc>", { desc = "clear hlsearch", silent = true })

autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        map("n", "gd", function() vim.lsp.buf.definition() end, opts)
        map("n", "K", function() vim.lsp.buf.hover() end, opts)
        map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        map("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})
map("n", "<leader>f", function()
    require("conform").format({ bufnr = 0 })
end)

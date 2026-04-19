require("vim._core.ui2").enable()
vim.g.mapleader = " "


require("config.global")
require("config.options")
require("plugins")
require("core.autocmds")
require("core.lsp_builtin")
require("config.keybind")

vim.filetype.add({
  pattern = {
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*/hyprland%.conf"] = "hyprlang",
  },
  extension = {
    sh = "bash",
  }
})

local function prettier_format()
  -- Map Neovim filetype to Prettier --parser names
  local parsers = {
    javascript = "babel",
    typescript = "typescript",
    javascriptreact = "babel",
    typescriptreact = "typescript",
    json = "json",
    html = "html",
    css = "css",
    scss = "scss",
    markdown = "markdown",
    yaml = "yaml"
  }

  local ft = vim.bo.filetype
  local parser = parsers[ft]

  if parser then
    -- Save view to keep cursor position
    local view = vim.fn.winsaveview()

    -- Run: %!npx prettier --stdin-filepath current_file --parser chosen_parser
    vim.cmd(string.format("%%! prettier --stdin-filepath %s --parser %s", vim.fn.expand("%"), parser))

    -- If there's a syntax error, Prettier returns non-zero; we undo to prevent clearing the file
    if vim.v.shell_error ~= 0 then
      vim.cmd("undo")
      print("Prettier Error: Check your syntax!")
    end

    vim.fn.winrestview(view)
  else
    print("No Prettier parser defined for filetype: " .. ft)
  end
end

-- 2. Create a Keymap (e.g., Space + f)
vim.keymap.set("n", "<leader>bb", prettier_format, { desc = "Format with Prettier" })

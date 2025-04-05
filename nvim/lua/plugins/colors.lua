return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      highlight_overrides = {
        all = function(c)
          return { Operator = { fg = "#008000" }, ["@keyword.return"] = { fg = c.red }, }
        end,
      },
      flavour = "mocha",
    })
  end
}

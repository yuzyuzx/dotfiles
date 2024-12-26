return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = function()
    vim.cmd([[colorscheme catppuccin]])
  end,
}

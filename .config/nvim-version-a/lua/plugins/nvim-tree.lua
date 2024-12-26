-- File Explorer
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = true,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {
      mode = "n",
      "<leader>n",
      "<cmd>NvimTreeToggle<CR>",
      desc = "NvimTreeをトグルする",
    },
  },
  opts = {},
}

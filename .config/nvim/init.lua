vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.opt.helplang = 'ja', 'en'
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.virtualedit = 'onemore'
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = true
vim.opt.listchars = { tab = '▸ ', trail = '·' }
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.showbreak = "↪"
vim.opt.keywordprg = ":help"
vim.opt.scrolloff = 3
vim.opt.clipboard:append{'unnamed'}

vim.g.mapleader = ','

vim.keymap.set('n', '<Leader>a', 'ggVG')
vim.keymap.set('n', '<Leader>q', ':nohlsearch<CR>')
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', '<Space>j', '10j')
vim.keymap.set('n', '<Space><Space>j', '20j')
vim.keymap.set('n', '<Space>k', '10k')
vim.keymap.set('n', '<Space><Space>k', '20k')
vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
vim.keymap.set('i', '<C-p>', '<Up>')
vim.keymap.set('i', '<C-n>', '<Down>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '<C-f>', '<Right>')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- treesitter
-- nvim-ts-autotag
require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  'vim-jp/vimdoc-ja',
  'nvim-lualine/lualine.nvim',
  { 'windwp/nvim-autopairs', event = "InsertEnter", opts = {} },
  { "nvim-tree/nvim-web-devicons", lazy = true },
})


require('lualine').setup {
  options = {
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    theme = "catppuccin"
  }
}

-- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd.colorscheme "catppuccin-latte"
